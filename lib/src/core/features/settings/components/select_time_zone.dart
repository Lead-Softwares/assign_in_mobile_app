import 'package:assign_in/config/theme_data.dart';
import 'package:assign_in/src/core/components/general_container.dart';
import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimeZoneSelector extends StatefulWidget {
  const TimeZoneSelector({super.key});

  @override
  State<TimeZoneSelector> createState() => _TimeZoneSelectorState();
}

class _TimeZoneSelectorState extends State<TimeZoneSelector> {
  String? selectedZone;
  late List<String> allLocations;
  List<String> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    allLocations = tz.timeZoneDatabase.locations.keys.toList();
    filteredLocations = List.from(allLocations);
    selectedZone = allLocations.first;
  }

  String _getOffset(tz.Location location) {
    final now = tz.TZDateTime.now(location);
    final offsetSeconds = location.timeZone(now.millisecondsSinceEpoch).offset;
    final duration = Duration(seconds: offsetSeconds);

    final hours = duration.inHours;
    final minutes = duration.inMinutes.abs() % 60;
    final sign = hours >= 0 ? '+' : '-';
    final hStr = hours.abs().toString().padLeft(2, '0');
    final mStr = minutes.toString().padLeft(2, '0');

    return '$sign$hStr:$mStr';
  }

  String _getCityName(String locationName) {
    final parts = locationName.split('/');
    return parts.length > 1 ? parts.last.replaceAll('_', ' ') : locationName;
  }

  void _showTimeZones() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(myPadding / 2),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Search time zone...',
                        ),
                        onChanged: (value) {
                          setModalState(() {
                            if (value.isEmpty) {
                              filteredLocations = List.from(allLocations);
                            } else {
                              filteredLocations = allLocations
                                  .where(
                                    (loc) => loc.toLowerCase().contains(
                                      value.toLowerCase(),
                                    ),
                                  )
                                  .toList();
                            }
                          });
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredLocations.length,
                        itemBuilder: (context, index) {
                          final locationName = filteredLocations[index];
                          final location = tz.getLocation(locationName);
                          final city = _getCityName(locationName);
                          final offset = _getOffset(location);

                          return ListTile(
                            title: Text(
                              locationName,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            subtitle: Text(
                              '$city · $offset',
                              style: context.textTheme.bodySmall,
                            ),
                            onTap: () {
                              setState(() {
                                selectedZone = locationName;
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = tz.getLocation(selectedZone!);
    final city = _getCityName(selectedZone!);
    final offset = _getOffset(location);

    return GeneralContainer(
      padding: const EdgeInsetsGeometry.all(0),
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(myPadding / 1.5),
      child: ListTile(
        style: ListTileStyle.list,
        title: Text(
          selectedZone ?? 'Select Time Zone',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '$city · $offset',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 11,
            color: MyColors.textColor,
          ),
        ),
        trailing: IconButton(
          icon: SvgPicture.asset('assets/svg/arrow.svg'),
          onPressed: _showTimeZones,
        ),
      ),
    );
  }
}
