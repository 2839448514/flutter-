import 'package:flutter/material.dart';

class LearningCenterPage extends StatelessWidget {
  const LearningCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习中心'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 导航到设置页面
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息卡片
            _buildUserInfoCard(),
            
            // 学习进度
            _buildLearningProgress(),
            
            // 最近学习
            _buildRecentLearning(),
            
            // 学习成就
            _buildAchievements(),
            
            // 学习路径
            _buildLearningPath(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue[100],
            child: const Icon(
              Icons.person,
              size: 40,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Flutter学习者',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildLevelBadge('初级开发者'),
                  const SizedBox(width: 8),
                  Text(
                    '已学习14天',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelBadge(String level) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        level,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLearningProgress() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '学习进度',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildProgressIndicator('Flutter基础', 0.75),
              _buildProgressIndicator('组件掌握', 0.45),
              _buildProgressIndicator('项目实战', 0.25),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(String label, double progress) {
    // 使用内置组件替代 CircularPercentIndicator
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.grey[200],
                color: progress > 0.7 ? Colors.green : 
                      progress > 0.4 ? Colors.orange : Colors.red,
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildRecentLearning() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '最近学习',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.code, color: Colors.blue),
              ),
              title: const Text('Flutter组件详解'),
              subtitle: const Text('上次学习: 今天'),
              trailing: const Text('75%'),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.web, color: Colors.green),
              ),
              title: const Text('布局与定位'),
              subtitle: const Text('上次学习: 2天前'),
              trailing: const Text('40%'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '学习成就',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAchievementItem(Icons.emoji_events, '初学者', '完成首个课程'),
              _buildAchievementItem(Icons.local_fire_department, '连续学习', '已连续学习7天'),
              _buildAchievementItem(Icons.star_border, '组件大师', '解锁10种组件'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(IconData icon, String title, String description) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber[300]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.amber, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPath() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '推荐学习路径',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Flutter 开发者路径',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPathStep(1, '基础入门', true),
                  _buildPathStep(2, '组件掌握', true),
                  _buildPathStep(3, '布局与动画', false),
                  _buildPathStep(4, '状态管理', false),
                  _buildPathStep(5, '项目实战', false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathStep(int step, String title, bool completed) {
    return Row(
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 8),
        Text(
          '$step. $title',
          style: TextStyle(
            fontSize: 14,
            color: completed ? Colors.green : Colors.grey,
            decoration: completed ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
