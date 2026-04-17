import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_entity.dart';

class TvShowItemCard extends StatelessWidget {
  final TvShowEntity show;

  const TvShowItemCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '${RoutesName.tvShowDetailScreen}/${show.permalink}',
          arguments: show,
        );
      },
      child: Tooltip(
        message: show.name,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- POSTER IMAGE ---
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: show.imageThumbnailPath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // --- TITLE ---
            Text(
              show.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 4),

            // --- NETWORK & STATUS ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    show.network ?? 'Unknown Network',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ),
                _buildStatusBadge(show.status),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final isRunning = status.toLowerCase() == 'running';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isRunning
            ? Colors.green.withValues(alpha: 0.15)
            : Colors.red.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isRunning ? Colors.green.shade700 : Colors.red.shade700,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
