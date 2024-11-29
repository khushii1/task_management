import 'package:jio_works/utilities/library.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration:BoxDecoration(
          color:primaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
                      child: const Row(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          TextWidget(text: "New Card",color: Colors.white,)
                        ],
                      ).pSymmetric(h: 10,v: 5)
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        decoration:BoxDecoration(
                            color:primaryColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:
                            const TextWidget(text: "Detailed",color: Colors.white,)
                         .pSymmetric(h: 10,v: 5)
                    ),
                    20.widthBox,
                    Container(
                        decoration:BoxDecoration(
      
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:
                        const TextWidget(text: "Simplified",color: Colors.black,)
                            .pSymmetric(h: 10,v: 5)
                    ),
                    20.widthBox,
                    Icon(Icons.settings,color: primaryColor,)
                  ],
                )
              ],
            ),
            20.heightBox,
            SizedBox(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(

                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                      color: Color(0xffebebeb)
                    ),
                    width: 260,
                    height: 280,

                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 40,
                          decoration: const BoxDecoration(

                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                              color: Color(0xffb5b5b5)
                          ),
                          child: const TextWidget(text: "To be Assigned / 0",color:Colors.white,fontWeight: FontWeight.w400,fontSize: 20,).pSymmetric(h: 20,v: 10),
      
                        ),
                        const SizedBox(
                          width: 260,
                          height: 220,

      
                        )
                      ],
                    ),
                  ).p4(),
                  Container(

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                        color: Color(0xffebebeb)
                    ),
                    width: 260,
                    height: 280,

                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 40,
                          decoration: const BoxDecoration(

                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                              color: Color(0xff609fff)
                          ),
                          child: const TextWidget(text: "Assigned / 0",color:Colors.white,fontWeight: FontWeight.w400,fontSize: 20,).pSymmetric(h: 20,v: 10),

                        ),
                        const SizedBox(
                          width: 260,
                          height: 220,


                        )
                      ],
                    ),
                  ).p4(),
                  Container(

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                        color: Color(0xffebebeb)
                    ),
                    width: 260,
                    height: 280,

                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 40,
                          decoration: const BoxDecoration(

                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                              color: Color(0xfffdab3d)
                          ),
                          child: const TextWidget(text: "Work in Progress / 0",color:Colors.black,fontWeight: FontWeight.w400,fontSize: 20,).pSymmetric(h: 20,v: 10),

                        ),
                        const SizedBox(
                          width: 260,
                          height: 220,


                        )
                      ],
                    ),
                  ).p4(),
                  Container(

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                        color: Color(0xffebebeb)
                    ),
                    width: 260,
                    height: 280,

                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 40,
                          decoration: const BoxDecoration(

                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                              color: Color(0xffb24141)
                          ),
                          child: const TextWidget(text: "Decesion Pending / 0",color:Colors.white,fontWeight: FontWeight.w400,fontSize: 20,).pSymmetric(h: 20,v: 10),

                        ),
                        const SizedBox(
                          width: 260,
                          height: 220,


                        )
                      ],
                    ),
                  ).p4(),
                  Container(

                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                        color: Color(0xffebebeb)
                    ),
                    width: 260,
                    height: 280,

                    child: Column(
                      children: [
                        Container(
                          width: 260,
                          height: 40,
                          decoration: const BoxDecoration(

                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                              color: Color(0xff66ba6a)
                          ),
                          child: const TextWidget(text: "Done / 0",color:Colors.white,fontWeight: FontWeight.w400,fontSize: 20,).pSymmetric(h: 20,v: 10),

                        ),
                        const SizedBox(
                          width: 260,
                          height: 220,


                        )
                      ],
                    ),
                  ).p4(),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
