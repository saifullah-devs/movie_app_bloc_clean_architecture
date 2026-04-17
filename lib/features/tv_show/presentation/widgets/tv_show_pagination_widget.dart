import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import '../bloc/tv_show_bloc.dart';

class TvShowPaginationWidget extends StatelessWidget {
  const TvShowPaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Industrial Standard: Pull all logic from the theme
    final theme = Theme.of(context);

    return BlocBuilder<TvShowBloc, TvShowState>(
      builder: (context, state) {
        final isLoading = state.popularTvShows.status == GetApiStatus.loading;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(
                // Use the theme's divider color instead of hardcoded white10
                color: theme.dividerColor.withValues(alpha: 0.1),
                width: 0.5,
              ),
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PREVIOUS BUTTON
                _NavButton(
                  label: 'Prev',
                  icon: Icons.chevron_left,
                  onPressed: (state.page > 1 && !isLoading)
                      ? () => context.read<TvShowBloc>().add(
                          PageChanged(state.page - 1),
                        )
                      : null,
                ),

                // PAGE INDICATOR
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    // Adaptive color: light grey in dark mode, light primary in light mode
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Page ${state.page}',
                    // Using labelLarge from your new 15-type TextTheme
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // NEXT BUTTON
                _NavButton(
                  label: 'Next',
                  icon: Icons.chevron_right,
                  isForward: true,
                  onPressed: !isLoading
                      ? () => context.read<TvShowBloc>().add(
                          PageChanged(state.page + 1),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isForward;

  const _NavButton({
    required this.label,
    required this.icon,
    this.onPressed,
    this.isForward = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isEnabled = onPressed != null;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // Colors derived from the theme's ColorScheme
        foregroundColor: isEnabled
            ? theme.colorScheme.primary
            : theme.disabledColor,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isForward) Icon(icon, size: 20),
          Text(
            label,
            // Using titleSmall for buttons as it's cleaner for interaction labels
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isEnabled
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
            ),
          ),
          if (isForward) Icon(icon, size: 20),
        ],
      ),
    );
  }
}
