/*
 * Created on Sun Nov 22 2020
 *
 * BSD 3-Clause License
 *
 *Copyright (c) 2020, Kanan Yusubov
 *All rights reserved.
 *
 *Redistribution and use in source and binary forms, with or without
 *modification, are permitted provided that the following conditions are met:
 *
 *1. Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *2. Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *3. Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 *THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    Key key,
    @required this.onNavItemTapped,
  }) : super(key: key);

  final ValueChanged<int> onNavItemTapped;

  @override
  _AppBottomNavBarState createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: _selectedIndex,
      animationDuration: Duration(milliseconds: 300),
      items: [
        _navBarItem(context, CupertinoIcons.info, 'Məlumat'),
        _navBarItem(context, CupertinoIcons.chart_bar_square, 'Azərbaycan'),
        _navBarItem(context, CupertinoIcons.news, 'Xəbərlər'),
      ],
      onItemSelected: (int selectedIndex) {
        setState(() {
          _selectedIndex = selectedIndex;
        });
        widget.onNavItemTapped?.call(selectedIndex);
      },
    );
  }

  BottomNavyBarItem _navBarItem(
      BuildContext context, IconData icon, String text) {
    return BottomNavyBarItem(
      activeColor: Theme.of(context).primaryColor,
      inactiveColor: Theme.of(context).accentColor,
      icon: Icon(icon),
      title: Text(text),
    );
  }
}
