import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../screens/profile/widget/circle_icon_button.dart';
import '../widget/ReviewItemCard.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  var selectedIndex = 0;
  List<String> textTab = ['Description', "Reviews"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 36),
                  Text(
                    "service details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffE6F4F1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Cleaning",
                      style: TextStyle(color: Color(0xff115E59)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Office Cleaning Service ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left large image
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        'https://picsum.photos/400/400?1',
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Right 4 small images (2x2 grid)
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  'https://picsum.photos/200/200?2',
                                  height: 85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  'https://picsum.photos/200/200?3',
                                  height: 85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  'https://picsum.photos/200/200?5',
                                  height: 85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  'https://picsum.photos/200/200?5',
                                  height: 85,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F5F2), // light mint background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side: Price info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Starting Price",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "₦24.00",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                      ],
                    ),

                    // Right side: Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F6151), // dark green
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Submit A Offer",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Profile Image
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/44.jpg",
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Name & Rating
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Grace Carey",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 3),
                              Text("4.5 ", style: TextStyle(fontSize: 13)),
                              Text(
                                "(149 Reviews)",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Chat Now Button
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.teal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.teal,
                        size: 16,
                      ),
                      label: const Text(
                        "Chat Now",
                        style: TextStyle(fontSize: 13, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: List.generate(textTab.length, (index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      print(index);
                    },
                    child: Container(
                      height: 40,
                      width: 120.w,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(0xFF115E59)
                            : Color(0xFF115E59).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          textTab[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Expanded(
                child: selectedIndex == 0
                    ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Text("Description  :- ",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),),
                          Text("─Delivering professional, reliable, and efficient service in your area,"
                              " this provider brings a strong reputation and years of experience."
                              " Whether it's home maintenance, repairs, or skilled labor, you'll"
                              " benefit from clean execution, attention to detail, and a commitment to screens satisfaction."),

                          Text("📋 Service Details",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),),
                          Text("📋 Service DetailsCategory: Home Cleaning & MaintenanceExperience: 5+ YearsLocation: Manhattan, New YorkAvailability: 7 Days a WeekOn-Site Support: YesTools Provided: YesCertified & Verified: ✅Customer Rating: ⭐ 4.8 (320+ Reviews)Languages Spoken: English, SpanishPrice Range: Starting from ₦50")
                        ],
                      ),
                    )
                    : selectedIndex == 1
                    ? SingleChildScrollView(
                   child: Column(
                    children: [
                      // Overall Rating Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xffE6F4F1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              "4.8",
                              style: TextStyle(
                                fontSize: 56,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "of 125 reviews",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 22),
                                Icon(Icons.star, color: Colors.amber, size: 22),
                                Icon(Icons.star, color: Colors.amber, size: 22),
                                Icon(Icons.star, color: Colors.amber, size: 22),
                                Icon(Icons.star_half, color: Colors.amber, size: 22),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      //  Review Cards
                      const ReviewItem(
                        name: "Grace Carey",
                        comment:
                        "I was a bit nervous to be buying a secondhand phone from Amazon, but I couldn't be happier with my purchase! I have a pre-paid data plan so I was worried that this phone wouldn’t connect with my data plan, since the new phones don’t have the physical sim tray anymore.",
                        date: "24 January, 2023",
                      ),
                      const ReviewItem(
                        name: "Ronald Richards",
                        comment:
                        "I was a bit nervous to be buying a secondhand phone from Amazon, but I couldn't be happier with my purchase! I have a pre-paid data plan so I was worried that this phone wouldn’t connect with my data plan, since the new phones don’t have the physical sim tray anymore.",
                        date: "24 January, 2023",
                      ),
                      const ReviewItem(
                        name: "Darcy King",
                        comment:
                        "I was a bit nervous to be buying a secondhand phone from Amazon, but I couldn't be happier with my purchase! I have a pre-paid data plan so I was worried that this phone wouldn’t connect with my data plan, since the new phones don’t have the physical sim tray anymore.",
                        date: "24 January, 2023",
                      ),
                      const SizedBox(height: 10),
                      // View More Button
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0E7C5F),
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "View More",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : const Center(
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
