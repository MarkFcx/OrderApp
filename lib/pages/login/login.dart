import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../configs/colors.dart';
import '../../generated/l10n.dart';
import '../../routes.dart';
import '../../utils/icons.dart';

class RoundCheckBox extends StatelessWidget {
  final bool value;

  const RoundCheckBox({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value
        ? Icon(
            Icons.check_circle_outline,
            size: 18.w,
            color: GapSenseColors.loginBtnBackground,
          )
        : Icon(
            Icons.panorama_fish_eye,
            size: 18.w,
            color: Colors.grey,
          );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _showPassword = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false; // 是否勾选了同意

  // 登录时数据的处理都放在这里
  _loginHandler() async {
    var navigator = Navigator.of(context);
    navigator.pushNamed(Routes.hallPage, arguments: "a");
  }

  @override
  void deactivate() {
    super.deactivate();
    var bool = ModalRoute.of(context)?.isCurrent;
    if (bool!) {
      // 监听到页面返回，刷新页面操作
      setState(() {});
    }
  }

  // 登录界面的布局都在这里
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(GapSenseIcons.settings))
      ]),
      body: Padding(
        // Note: 不能指定下边距，否则弹出的键盘重新布局时，会导致Padding被顶出界面
        padding: EdgeInsets.fromLTRB(372.w, 40.h, 372.w, 0),
        // Note: 必须用ListView包裹TextFiled, 弹出键盘时重新布局，否则弹出的键盘可能会覆盖TextFiled
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 4.w,
                  height: 26.h,
                  color: GapSenseColors.dividerBlockColor,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  '罗森博特',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: GapSenseColors.displayTextColor,
                    fontFamily: 'SFPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              S.of(context).welcome_login,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: GapSenseColors.displayTextColor,
                fontFamily: 'PingFangSC',
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              height: 52.h,
              child: TextField(
                controller: _userNameController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    //label: Text('用户名'),
                    //hintText: '请输入用户名',
                    hintText: S.of(context).user_name,
                    prefixIcon: const Icon(GapSenseIcons.user),
                    suffixIcon: _userNameController.text.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              _userNameController.clear();
                              setState(() {});
                            },
                            icon: const Icon(GapSenseIcons.cancel))),
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              height: 52.h,
              child: TextField(
                controller: _passwordController,
                obscureText: !_showPassword,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  //label: const Text('密码'),
                  //hintText: '请输入密码',
                  hintText: S.of(context).password,
                  prefixIcon: const Icon(GapSenseIcons.password),
                  suffixIcon: _passwordController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _passwordController.clear();
                            setState(() {});
                          },
                          icon: const Icon(GapSenseIcons.cancel)),
                  // 密码明文与否的设置，暂时不需要
                  // suffixIcon: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         _showPassword = !_showPassword;
                  //       });
                  //     },ENh
                  //     icon: Icon(_showPassword
                  //         ? Icons.visibility
                  //         : Icons.visibility_off)),
                ),
              ),
            ),
            SizedBox(height: 56.h),
            SizedBox(
              // 通过SizedBox限定button的高度，这是给button指定高度的一种方式
              height: 48.h,
              child: ElevatedButton(
                // ignore: todo
                // TODO: 按键背景色为渐变色
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      GapSenseColors.loginBtnBackground),
                ),
                onPressed: (() {
                  _loginHandler();
                }),
                child: Text(
                  S.of(context).login,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PingFangSC',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            // SizedBox(
            //   height: 32.h,
            // ),
            GestureDetector(
              // 点击任意位置都可响应点击事件，改善效果
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                    width: 200.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RoundCheckBox(
                        value: isChecked,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '我已阅读并同意 ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GapSenseColors.displayTextColor,
                          fontFamily: 'PingFangSC',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '《服务条款》',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GapSenseColors.loginBtnBackground,
                          fontFamily: 'PingFangSC',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '和',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GapSenseColors.displayTextColor,
                          fontFamily: 'PingFangSC',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '《隐私政策》',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: GapSenseColors.loginBtnBackground,
                          fontFamily: 'PingFangSC',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 165.h,
            ),
            Text(
              '${S.of(context).copyright1} \u{A9}${S.of(context).company} ${S.of(context).copyright2}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: GapSenseColors.copywriteTextColor,
                fontFamily: 'PingFangSC',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
