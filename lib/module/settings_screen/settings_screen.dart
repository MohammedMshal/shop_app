import 'package:flutter/material.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme
            .of(context)
            .textTheme
            .titleMedium,),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: heightPage(context: context),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: myGrey,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //account
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/62070030_674780319610281_2233976940652396544_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGSoaCZ0QSaEvDpBS6CEM4HBlJO8VaYL58GUk7xVpgvn0CFRZFIW-uY3V0G_i3MrxuLbX2lg0Iwn6I0mrK__hQc&_nc_ohc=FlN7w4Il1MoAX_xBNnd&tn=W5_SImZiHwpP3wwk&_nc_ht=scontent.faly1-2.fna&oh=00_AT8CD5JhMMD3oLOlplto5g2jCc-snEurvu6fGEwv-YB4-g&oe=62FE875D'),

                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Mohammed Mshal'),
                      SizedBox(height: 5.0),
                      Text('MohammedMshal01@gmail.com'),
                    ],
                  )
                ],
              ),
              const Divider(),
              //dark mode
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode_outlined),
                    const SizedBox(width: 10),
                    Text('Dark Mode', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                    const Spacer(),
                    defaultSwitch(value: true, onChanged: (value) {})
                  ],
                ),
              ),
              //address
              InkWell(
                  onTap: (){},
                  child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 10),
                  Text('Address', style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium),
                ],
              ),
                  ),
              const SizedBox(height: 20),
              //edit account
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    const Icon(Icons.settings_outlined),
                    const SizedBox(width: 10),
                    Text('Settings', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //log out
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    const Icon(Icons.login_outlined),
                    const SizedBox(width: 10),
                    Text('Login out', style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
