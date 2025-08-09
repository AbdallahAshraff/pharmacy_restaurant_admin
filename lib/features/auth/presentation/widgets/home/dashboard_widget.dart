
import 'package:flutter/material.dart';
import 'package:pharmacy_restaurant_admin/features/auth/data/models/orders_model.dart';

  Widget buildTotalOrdersCard( int totalOrders) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey[400], size: 20),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '$totalOrders',
              
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: Colors.green[600],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '44.7%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Compared to Oct 2023',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOrdersCards({
    required String title,
    required int value,
    required String percentage,
    required bool isPositive,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              Icon(Icons.more_vert, color: Colors.black, size: 12),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, color: Colors.white, size: 12),
              ),
              const SizedBox(width: 8),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? Colors.green[600] : Colors.red[600],
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isPositive ? Colors.green[600] : Colors.red[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Compared to Oct 2023',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

