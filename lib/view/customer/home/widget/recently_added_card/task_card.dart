import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final double price;
  final String fromLocation;
  final String toLocation;
  final String dateTime;
  final String userName;
  final String userImage;
  final String status;
  final String offerCount;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.title,
    required this.price,
    required this.fromLocation,
    required this.toLocation,
    required this.dateTime,
    required this.userName,
    required this.userImage,
    required this.status,
    required this.offerCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- TITLE + PRICE ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "₦${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ---------- LOCATIONS ----------
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: Colors.teal, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    fromLocation,
                    style: const TextStyle(color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.location_city_outlined,
                    color: Colors.teal, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    toLocation,
                    style: const TextStyle(color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.access_time_outlined,
                    color: Colors.teal, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dateTime,
                    style: const TextStyle(color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ---------- PROFILE + STATUS ----------
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(userImage),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          status,
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "• $offerCount offer${(offerCount != '1') ? 's' : ''}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
