import 'package:get/get.dart';
import 'package:jio_works/controllers/table_screen_controller.dart';
import 'package:jio_works/custom_widgets/search_widget.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:jio_works/utilities/utilities.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableScreen extends GetView<TableScreenController> {
  final Map<String, dynamic> teamData;
  final Map<String, dynamic> projectData;
  const TableScreen(
      {super.key, required this.teamData, required this.projectData});

  @override
  Widget build(BuildContext context) {
    Get.put(
        TableScreenController(teamData: teamData, projectData: projectData));
    return GetBuilder<TableScreenController>(
        builder: (controller) => SingleChildScrollView(
              child: SizedBox(
                height: context.screenHeight * 0.7,
                child: controller.taskHeadingList.isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                    TextWidget(
                                      text: "New Task Group",
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up_rounded,
                                          color: Colors.grey[400]!,
                                        ),
                                        TextWidget(
                                          text: "Collapse",
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                    5.widthBox,
                                    divider(width: 0.5, height: 25)
                                        .pSymmetric(h: 5.0),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.grey[400]!,
                                        ),
                                        TextWidget(
                                          text: "Expanded",
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey[700]!,
                                    ),
                                    5.widthBox,
                                    TextWidget(
                                      text: "Person",
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: borderColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.filter,
                                      color: Colors.grey[700]!,
                                    ),
                                    5.widthBox,
                                    TextWidget(
                                      text: "Filter",
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ).pSymmetric(h: 8.0, v: 5.0),
                              ),
                              20.widthBox,
                              SearchWidget(
                                hint: "Search",
                              ).wh(120, 40)
                            ],
                          ).pSymmetric(h: 15.0, v: 10.0),
                          SfDataGrid(
                            source: ,
                            columns: <GridColumn>[
                              GridColumn(
                                  columnName: 'id',
                                  label: Container(
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'ID',
                                      ))),
                              GridColumn(
                                  columnName: 'name',
                                  label: Container(
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Name'))),
                              GridColumn(
                                  columnName: 'designation',
                                  width: 120,
                                  label: Container(
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Designation'))),
                              GridColumn(
                                  columnName: 'salary',
                                  label: Container(
                                      padding: EdgeInsets.all(16.0),
                                      alignment: Alignment.centerRight,
                                      child: Text('Salary'))),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          noDataTable.image().h(300),
                          20.heightBox,
                          const TextWidget(
                            text:
                                "This space is empty. Let's create a task to get started",
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          20.heightBox,
                          ButtonWidget(
                                  onTap: () {
                                    controller.createTaskHeading();
                                  },
                                  text: "Create Task")
                              .wh(150, 40)
                        ],
                      ),
              ),
            ));
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employees) {
    buildDataGridRows();
  }

  final List<Employee> employees;
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() {
    dataGridRows = employees
        .map((employee) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: employee.id),
              DataGridCell<String>(columnName: 'name', value: employee.name),
              DataGridCell<String>(columnName: 'designation', value: employee.designation),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}

// Define the data model
class Employee {
  Employee(this.id, this.name, this.designation);

  final int id;
  final String name;
  final String designation;
}

// Create sample data
List<Employee> getEmployeeData() {
  return [
    Employee(1, 'John', 'Manager'),
    Employee(2, 'Doe', 'Developer'),
    Employee(3, 'Smith', 'Designer'),
    Employee(4, 'Jane', 'HR'),
  ];
}
