import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Line Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LineChartDemo(),
    );
  }
}

class LineChartDemo extends StatefulWidget {
  const LineChartDemo({Key? key}) : super(key: key);

  @override
  State<LineChartDemo> createState() => _LineChartDemoState();
}

class _LineChartDemoState extends State<LineChartDemo> {
  bool showDetail = false;
  
  // Dữ liệu voltage và current cho đường 1
  final List<double> voltage1 = [
    -500, -490, -480, -470, -460, -450, -440, -430, -420, -410, -400, -390, -380, -370, -360, -350, 
    -340, -330, -320, -310, -300, -290, -280, -270, -260, -250, -240, -230, -220, -210, -200, -190, 
    -180, -170, -160, -150, -140, -130, -120, -110, -100, -90, -80, -70, -60, -50, -40, -30, -20, 
    -10, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 
    200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 
    390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 500, 490, 480, 470, 460, 450, 440, 
    430, 420, 410, 400, 390, 380, 370, 360, 350, 340, 330, 320, 310, 300, 290, 280, 270, 260, 250, 
    240, 230, 220, 210, 200, 190, 180, 170, 160, 150, 140, 130, 120, 110, 100, 90, 80, 70, 60, 50, 
    40, 30, 20, 10, 0, -10, -20, -30, -40, -50, -60, -70, -80, -90, -100, -110, -120, -130, -140, 
    -150, -160, -170, -180, -190, -200, -210, -220, -230, -240, -250, -260, -270, -280, -290, -300, 
    -310, -320, -330, -340, -350, -360, -370, -380, -390, -400, -410, -420, -430, -440, -450, -460, 
    -470, -480, -490, -500
  ];

  final List<double> current1 = [
    -11320.45, -11653.4, -11875.375, -11690.4, -11702.733, -11423.219, -11408.142, -11309.945, 
    -11124.212, -11103.561, -10886.783, -10733.648, -10610.344, -10370.222, -10101.097, -9931.348, 
    -9711.065, -9433.079, -8971.031, -8872.328, -8833.395, -8861.499, -8783.906, -8693.418, 
    -8489.408, -8465.234, -8389.172, -8577.727, -8837.2, -8690.584, -8950.17, -8913.835, -9062.243, 
    -9247.584, -9284.842, -9581.009, -9766.142, -10148.542, -10855.653, -10626.907, -11378.278, 
    -11404.503, -11811.685, -12104.129, -12707.288, -12857.847, -13405.045, -13785.614, -14538.803, 
    -15138.697, -15737.7, -16507.282, -17259.436, -18136.631, -18975.706, -20213.704, -21645.962, 
    -23201.955, -25011.931, -26725.837, -29232.281, -31304.981, -33793.229, -35239.553, -36995.019, 
    -37544.349, -37498.731, -36926.735, -35389.047, -33575.969, -30831.264, -27832.211, -24363.833, 
    -21098.173, -17373.702, -13563.858, -10312.52, -6774.951, -3624.107, -654.736, 1977.252, 4510.28, 
    6823.877, 8439.419, 9749.132, 10946.184, 11929.755, 12508.646, 13177.45, 13815.315, 14102.888, 
    14189.401, 14684.046, 15247.716, 15822.454, 16719.857, 18098.445, 18857.109, 19569.526, 20059.887, 
    20460.813, 19870.033, 19732.757, 19638.055, 19708.704, 19478.72, 19721.566, 19799.845, 20128.854, 
    20338.608, 20666.171, 20993.26, 21285.469, 21787.86, 22274.693, 22604.434, 23172.584, 23767.839, 
    24229.633, 25099.916, 25987.883, 27239.875, 28841.069, 30901.981, 34638.342, 40566.216, 42899.753, 
    44765.673, 44981.659, 44121.836, 42797.373, 40367.511, 37784.253, 34485.438, 31266.914, 27762.651, 
    24485.863, 21263.646, 18061.453, 15180.083, 12338.337, 9690.74, 7491.009, 5357.3, 3616.861, 
    2325.479, 1092.905, -340.339, -932.986, -1830.25, -2474.87, -2840.848, -3251.706, -3658.626, 
    -3857.236, -4429.021, -4389.861, -4641.394, -4712.185, -4745.635, -5002.357, -5025.089, -5118.24, 
    -5156.868, -5126.803, -5129.657, -5268.57, -5019.867, -5353.212, -5159.46, -5205.991, -5378.884, 
    -5230.058, -5534.039, -5363.791, -5334.377, -5267.823, -5457.8, -5055.008, -5132.044, -4949.476, 
    -5062.273, -4965.025, -4896.224, -5136.833, -5490.061, -5392.048, -5403.128, -5448.142, -5762.798, 
    -5956.68, -5904.218, -5951.358, -6097.567, -6531.967, -6577.52, -6959.479, -7175.966, -7523.432, 
    -7933.383, -8629.797, -8998.585
  ];

  // Dữ liệu voltage và current cho đường 2
  final List<double> voltage2 = [
    -500, -490, -480, -470, -460, -450, -440, -430, -420, -410, -400, -390, -380, -370, -360, -350, 
    -340, -330, -320, -310, -300, -290, -280, -270, -260, -250, -240, -230, -220, -210, -200, -190, 
    -180, -170, -160, -150, -140, -130, -120, -110, -100, -90, -80, -70, -60, -50, -40, -30, -20, 
    -10, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 
    200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 
    390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 500, 490, 480, 470, 460, 450, 440, 
    430, 420, 410, 400, 390, 380, 370, 360, 350, 340, 330, 320, 310, 300, 290, 280, 270, 260, 250, 
    240, 230, 220, 210, 200, 190, 180, 170, 160, 150, 140, 130, 120, 110, 100, 90, 80, 70, 60, 50, 
    40, 30, 20, 10, 0, -10, -20, -30, -40, -50, -60, -70, -80, -90, -100, -110, -120, -130, -140, 
    -150, -160, -170, -180, -190, -200, -210, -220, -230, -240, -250, -260, -270, -280, -290, -300, 
    -310, -320, -330, -340, -350, -360, -370, -380, -390, -400, -410, -420, -430, -440, -450, -460, 
    -470, -480, -490, -500
  ];

  final List<double> current2 = [
    -10167.544, -10532.143, -10969.337, -11310.593, -11644.068, -11351.045, -11512.513, -11320.678, 
    -11014.597, -10774.633, -10888.585, -10624.606, -10574.597, -10395.943, -10319.722, -10234.763, 
    -10329.02, -10258.128, -10043.949, -10244.884, -10018.503, -10157.996, -10351.008, -10387.851, 
    -10464.47, -10354.307, -10343.126, -10302.678, -10507.443, -10488.224, -10698.047, -10835.574, 
    -11099.34, -11159.113, -11636.909, -11890.091, -11985.767, -12250.036, -12074.051, -12325.454, 
    -12424.585, -12689.405, -12810.722, -13161.409, -13540.71, -13932.023, -14336.869, -14750.239, 
    -15540.903, -15868.256, -16832.853, -17633.453, -18591.802, -19548.068, -20630.207, -22271.542, 
    -23475.333, -25163.6, -27385.453, -29872.659, -32478.204, -35285.638, -37903.856, -40082.356, 
    -41311.312, -42003.189, -41829.584, -40744.508, -39363.081, -36987.121, -34254.867, -31072.329, 
    -27398.965, -23781.848, -19649.921, -15883.065, -12288.27, -8428.578, -5055.866, -1091.281, 
    3352.209, 6154.901, 8718.278, 10506.968, 11809.674, 12914.131, 13864.502, 14475.453, 15069.885, 
    15619.654, 15927.071, 16508.758, 16879.118, 16826.517, 17080.412, 17369.485, 17402.491, 17435.859, 
    17679.958, 17698.456, 17859.98, 18067.962, 18191.131, 18523.489, 18675.332, 18910.715, 19113.782, 
    19333.924, 19548.985, 19916.02, 20258.035, 20494.385, 21057.123, 21397.469, 21994.456, 22380.892, 
    23078.649, 23883.989, 24385.021, 25412.395, 26809.747, 28061.922, 30128.94, 33011.096, 40580.012, 
    44063.703, 46564.063, 47744.864, 47640.092, 46444.985, 44679.876, 41843.387, 38829.721, 35325.886, 
    31747.577, 28351.004, 24694.227, 21381.235, 18392.071, 15329.485, 12646.327, 10139.162, 8039.105, 
    5911.439, 4132.248, 2755.979, 1482.184, 450.854, -465.504, -966.75, -1809.235, -2331.137, 
    -2785.932, -2963.515, -3248.299, -3254.446, -3351.423, -3607.765, -3799.529, -4318.848, -4111.934, 
    -4438.036, -4329.79, -4476.4, -4341.205, -4345.01, -4301.213, -4287.883, -4268.84, -4258.049, 
    -4322.096, -4339.848, -4441.106, -4702.743, -4601.741, -4655.286, -4713.451, -4898.671, -4757.832, 
    -4994.593, -4952.575, -4943.498, -4926.466, -4991.755, -5229.807, -5552.896, -5443.984, -5589.36, 
    -5749.498, -5925.328, -6111.309, -6231.912, -6408.09, -6507.017, -6672.711, -7130.868, -7264.826, 
    -7388.215, -8139.905, -8209.623, -8927.368, -9189.855
  ];

  // Tạo các điểm dữ liệu cho đường 1
  List<FlSpot> getSpots1() {
    return List.generate(
      voltage1.length,
      (index) => FlSpot(voltage1[index], current1[index] / 1000), // Chia cho 1000 để giảm tỉ lệ
    );
  }

  // Tạo các điểm dữ liệu cho đường 2
  List<FlSpot> getSpots2() {
    return List.generate(
      voltage2.length,
      (index) => FlSpot(voltage2[index], current2[index] / 1000), // Chia cho 1000 để giảm tỉ lệ
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biểu đồ Voltage - Current'),
        actions: [
          IconButton(
            icon: Icon(showDetail ? Icons.zoom_out : Icons.zoom_in),
            onPressed: () {
              setState(() {
                showDetail = !showDetail;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biểu đồ đường Voltage - Current',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.blue, 'Đường 1'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.red, 'Đường 2'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _buildLineChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.3),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.3),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: const Text('Voltage (V)'),
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 100,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: const Text('Current (mA)'),
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
        ),
        minX: -500,
        maxX: 500,
        minY: showDetail ? -50 : -60,
        maxY: showDetail ? 50 : 60,
        lineBarsData: [
          LineChartBarData(
            spots: getSpots1(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
          LineChartBarData(
            spots: getSpots2(),
            isCurved: true,
            color: Colors.red,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.red.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            // tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            getTooltipItems: (List<LineBarSpot> touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final String currVal = (touchedSpot.y * 1000).toStringAsFixed(2);
                return LineTooltipItem(
                  '${touchedSpot.x.toStringAsFixed(1)} V\n$currVal mA',
                  const TextStyle(color: Colors.white),
                );
              }).toList();
            },
          ),
          touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {},
          handleBuiltInTouches: true,
        ),
      ),
    );
  }
}