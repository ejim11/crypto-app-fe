import 'package:crypto_app/widgets/profile/settings_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 251, 255, 1),
        elevation: 0,
        leading: Container(
          width: 42,
          height: 42,
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Profile Avatar with Edit Button
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(18, 132, 255, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'JD',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // User Name
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),

                // User Email
                Text(
                  'johndoe@figma.com',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // Settings Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Settings Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(0, 0),
                        blurRadius: 16.6,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SettingsTile(
                        icon: Icons.person_outline,
                        title: 'Account Settings',
                        onTap: () {
                          // Navigate to Account Settings
                        },
                      ),
                      _buildDivider(),
                      SettingsTile(
                        icon: Icons.account_balance_outlined,
                        title: 'Bank Account',
                        onTap: () {
                          // Navigate to Bank Account
                        },
                      ),
                      _buildDivider(),
                      SettingsTile(
                        icon: Icons.swap_horiz,
                        title: 'Transfer Limit',
                        onTap: () {
                          // Navigate to Transfer Limit
                        },
                      ),
                      _buildDivider(),
                      SettingsTile(
                        icon: Icons.shield_outlined,
                        title: 'Security',
                        onTap: () {
                          // Navigate to Security
                        },
                      ),
                      _buildDivider(),
                      SettingsTile(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        onTap: () {
                          // Navigate to Notifications
                        },
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, thickness: 1, color: Colors.grey.shade100),
    );
  }
}
