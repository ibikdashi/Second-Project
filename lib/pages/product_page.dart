import 'package:flutter/material.dart';
import '../assit/constant.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    child:
                    Image.asset('images/header2.png'),height: 30.0,
                  ),
              ],
            ),
            leading: new IconButton(
                icon:new Icon(Icons.arrow_back),
                color: Color(0XFF3f51b5),
                onPressed:() {
                  Navigator.pop(context);
                }
            ),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0),
              child: Column(
                children: <Widget>[
                  pTitle('مؤسستنا :'),
                  boxproduct('تهدف شركة إمكان المالية إلى تحسين الأوضاع المعيشية في لبنان ، وتعمل على تعزيز الإستقرار الإقتصادي والإجتماعي في كافة المناطق اللبنانية لتمكين الطبقة العاملة من ذوي الدخل المحدود في مختلف القطاعات التجارية والخدماتية والصناعية والزراعية ، الإستفادة من القروض الصغيرة والصغيرة جدا.'),
                  pTitle('خدماتنا :'),
                  boxproduct('تقدم شركة إمكان المالية  ثلاثة أنواع من القروض:'),
                  boxproduct('•	 قرض المشاريع الصغيرة لتوسيع الأعمال ( بما في ذلك شراء المعدات والمخزون والمواد،زيادة رأس المال العامل ...)'),
                  boxproduct('•	قرض تحسين المنزل للتحسينات المنزلية البسيطة ( اصلاح السقوف والجدران والأرضيات والمطابخ ، بناء غرف , شراء اراضي ...)  '),
                  boxproduct('•	قرض شخصي لتلبية الإحتياجات الشخصية  لأصحاب المشاريع والموظفين العاملين في القطاعين العام والخاص( رسوم دراسة , مصاريف طبية , اثاث منزل ...)'),
                  pTitle('شروط الإقتراض :'),
                  boxproduct('•	أصحاب المشاريع الصغيرة القائمة  منذ سنة أو أكثر'),
                  boxproduct('•	موظف منذ سنة أو أكثر'),
                  boxproduct('•	السن بين 18 و 67 عاماً'),
                  boxproduct('•	لبناني الجنسية أو مقيم بصفة شرعية على الأراضي اللبنانية'),
                  pTitle('كيفية الحصول على قرض  :'),
                  boxproduct('يمكنكم تقديم طلب للحصول على قرض عبر الإنترنت  .'),
                  boxproduct('لمزيد من الأسئلة حول القروض، يرجى التوجه إلى إحدى فروعنا  أو الاتصال  بأحد مسؤولي القروض التابعين للمؤسسة المتواجدين على جميع الأراضي اللبنانية.'),
                  pTitle('قيمة القرض :'),
                  boxproduct('تتراوح قيمة القرض ما بين 500,000 ل.ل. و15,000,000 ل.ل. وتكون قيمة القرض وفق شروط تتعلق بحجم المشروع ودخل المقترض وقدرته على السداد ووجود الضمانات الكافية لأخذ القرض المطلوب'),
                  pTitle('فترة وطريقة السداد :'),
                  boxproduct('تتراوح فترة السداد من 4 أشهر إلى 48 شهراً وذلك بما يتناسب مع شروط المؤسسة التي تتعلق بمقدرة المقترض على السداد وبالمبلغ الموافق عليه. ويكون السداد بموجب دفعات شهرية متساوية تدفع لدى فروع بنك البحر المتوسط أو إحدى المراكز المعتمدة وفقاً لجدول الدفعات الشهرية.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}