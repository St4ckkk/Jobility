import 'package:flutter/material.dart';
import '../../../../core/assets/functions.dart';
import '../../../../core/imports.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Make the entire page scrollable
        child: Column(
          children: [
            _buildHeader(context),
            _buildBody(),
            _buildApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage(AssetPaths.getImagePath('group.png')),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/facebook-logo.png', height: 40),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Software Engineer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTag('Design'),
              const SizedBox(width: 45),
              _buildTag('Full-Time'),
              const SizedBox(width: 45),
              _buildTag('Junior'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('\$180,000/year',
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Seattle, USA',
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: AppTypography.bodyLarge.copyWith(
            fontSize: 12.0,
          )),
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: AppColors.grayAccentColor,
            indicatorColor: AppColors.primaryColor,
            tabs: const [
              Tab(text: 'Description'),
              Tab(text: 'Requirement'),
              Tab(text: 'About'),
              Tab(text: 'Reviews'),
            ],
          ),
          Container(
            height: 400, // Set a fixed height for the TabBarView
            child: TabBarView(
              children: [
                _buildDescription(),
                const Center(child: Text('Requirement Content')),
                const Center(child: Text('About Content')),
                const Center(child: Text('Reviews Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We are the teams who create all of Facebook\'s products used by billions of people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more?',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.grayAccentColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Responsibilities:',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textDarkColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...[
                  'Full stack web/mobile application development with a variety of coding languages',
                  'Create consumer products and features using internal programming language Hack',
                  'Implement web or mobile interfaces using XHTML, CSS, and JavaScript',
                ].map((responsibility) => RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.circle,
                                size: 6, color: AppColors.textDarkColor),
                            baseline: TextBaseline.ideographic,
                            alignment: PlaceholderAlignment.baseline,
                          ),
                          TextSpan(
                            text: ' $responsibility\n',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.grayAccentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Apply Now',
            style: AppTypography.caption
                .copyWith(color: Colors.white, fontSize: 16.0)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}
