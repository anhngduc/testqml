import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import DialFilter 1.0
import QtQml 2.0

Rectangle{
    id:rblock;
    x: lblock.x + lblock.width +20; y:lblock.y;
    width: (root.width - 30) /2 -10
    height: (root.height - 60)
    color: "white"

    property int fontsize1:20;
    property int fontsize2:20;
    property variant targetitem

    Connections {
        target: targetitem
        //onClicked: console.log("CLICKED!");
    }
        Rectangle{
            id: ipt
            x: 10; y:10;
            width: rblock.width - 20
            height: 50
            border.color: "blue"}
        TextInput{
            id: iptex;
            x: ipt.x + 10; y:ipt.y + ipt.height/2 -5;
            width: rblock.width - 20
            height: 50
            color: "black"

        }
        Rectangle{
            id: no1;
            Text{
                id: tno1
                text: "1";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2
                y:(parent.height - contentHeight)/2
            }
            color: "lightblue"
            x : 10; y: ipt.y + ipt.height + 20;
            width: (rblock.width - 40 ) /3
            height: (rblock.height - ipt.y - ipt.height -60 ) /4
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "1" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no2;
            Text{
                text: "2";font.pointSize: fontsize1;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "abc"
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 + 7;
            }
            color: "lightblue"
            x : 20 + no1.width ; y: ipt.y + ipt.height + 20;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "2" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no3;
            Text{
                text: "3";font.pointSize: fontsize1;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "def"
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 + 7;
            }
            color: "lightblue"
            x : no2.x + no2.width + 10 ; y: ipt.y + ipt.height + 20;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "3" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no4;
            Text{
                text: "4";font.pointSize: fontsize1;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "ghi";font.pointSize: fontsize2;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 + 7;
            }
            color: "lightblue"
            x : no1.x ; y: no1.y + no1.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "4" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no5;
            Text{
                text: "5"
                font.pointSize: fontsize1;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "jkl"
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 + 7;
            }
            color: "lightblue"
            x : no2.x ; y: no2.y + no2.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "5";dialFilter.setConditon(iptex.text); }
            }
        }
        Rectangle{
            id: no6;
            Text{
                text: "6";
                font.pointSize: fontsize1;
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "mno"
                color:"white" ; x:parent.width/2 - width/2
                y:parent.height/2 + 7;
            }
            color: "lightblue"
            x : no3.x ; y: no3.y + no3.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "6" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no7;
            Text{
                text: "7";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "pqrs";
                color:"white" ; x:parent.width/2 - width/2;
                y:parent.height/2 + 7;
                horizontalAlignment: Text.AlignHCenter;
            }
            color: "lightblue"
            x : no1.x ; y: no4.y + no4.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "7" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no8;
            Text{
                text: "8";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "tuv";
                color:"white" ; x:parent.width/2 - width/2;
                y:parent.height/2 + 7;
                horizontalAlignment: Text.AlignHCenter;
            }
            color: "lightblue"
            x : no2.x ; y: no5.y + no5.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "8" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no9;
            Text{
                text: "9";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "wxyz";
                color:"white" ; x:parent.width/2 - width/2;
                y:parent.height/2 + 7;
                horizontalAlignment: Text.AlignHCenter;
            }
            color: "lightblue"
            x : no3.x ; y: no6.y + no6.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "9" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: nos;
            Text{
                text: "*";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2
            }

            color: "lightblue"
            x : no1.x ; y: no7.y + no7.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "*" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: no0;
            Text{
                text: "0";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2 -4
            }
            Text{
                text: "+";
                color:"white" ; x:parent.width/2 - width/2;
                y:parent.height/2 + 7;
                horizontalAlignment: Text.AlignHCenter;
            }
            color: "lightblue"
            x : no2.x ; y: no8.y + no8.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "0";dialFilter.setConditon(iptex.text); }
                onPressAndHold: { iptex.text = iptex.text + "+" ;dialFilter.setConditon(iptex.text);}
            }
        }
        Rectangle{
            id: nosh;
            Text{
                text: "#";
                font.pointSize: fontsize1;
                color:"white" ;
                x:parent.width/2 - width/2;
                y:parent.height/2 - contentHeight/2
            }

            color: "lightblue"
            x : no3.x ; y: no9.y + no9.height + 10;
            width: no1.width
            height: no1.height
            MouseArea {
                anchors.fill: parent
                onClicked: { iptex.text = iptex.text + "#";dialFilter.setConditon(iptex.text); }
                onPressAndHold: { iptex.text =  "" ;dialFilter.setConditon("")}
            }
        }
    }
