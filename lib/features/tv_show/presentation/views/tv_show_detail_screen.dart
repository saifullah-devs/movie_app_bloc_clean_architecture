import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app_bloc/features/tv_show/domain/entities/tv_show_entity.dart';

class TvShowDetailScreen extends StatelessWidget {
  final TvShowEntity show;

  const TvShowDetailScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderInfo(context),
                      const SizedBox(height: 24),
                      _buildQuickInfoGrid(context), // New Info Grid
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
                      _buildAboutSection(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.0,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(
          !kIsWeb && Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'poster_${show.id}',
              child: CachedNetworkImage(
                imageUrl: show.imageThumbnailPath,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent, Colors.black87],
                  stops: [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          show.name,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Permalink: ${show.permalink}",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildStatusBadge(show.status),
            const SizedBox(width: 12),
            const Icon(Icons.tv, size: 16, color: Colors.blue),
            const SizedBox(width: 6),
            Text(
              show.network ?? 'N/A',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  /// Industrial Standard: Metadata Grid for all parameters
  Widget _buildQuickInfoGrid(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        _infoTile(
          context,
          Icons.calendar_today,
          "Started",
          show.startDate ?? 'Unknown',
        ),
        _infoTile(
          context,
          Icons.event_busy,
          "Ended",
          show.endDate ?? 'Running',
        ),
        _infoTile(context, Icons.public, "Country", show.country),
        _infoTile(
          context,
          Icons.fingerprint,
          "Internal ID",
          show.id.toString(),
        ),
      ],
    );
  }

  Widget _infoTile(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          "The TV show '${show.name}' (${show.permalink}) originated in ${show.country}. "
          "It premiered on ${show.startDate ?? 'an unknown date'} via ${show.network ?? 'Unknown Network'}. "
          "The series is currently marked as '${show.status}'.",
          style: const TextStyle(fontSize: 16, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    final isRunning = status.toLowerCase() == 'running';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (isRunning ? Colors.green : Colors.red).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: (isRunning ? Colors.green : Colors.red).withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: isRunning ? Colors.green : Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
