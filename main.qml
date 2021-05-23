import QtQuick.Window 2.2
import QtQuick 2.9
import QtQuick 2.0
import QtQuick.Layouts 1.3
Window {
    id: root;
    visible: true
    width: 640
    height: 480
    color: "gray"
    Rectangle{
        id: lblock;
        x: 10; y:30;
        width: (root.width - 30) /2
        height: (root.height - 60)
        color: "white"

        ContactList{
            anchors{
                top: tabbar.bottom
                left: parent.left
                right: parent.right
                topMargin: 1
            }


        }

    }
    Rectangle{
        id:rblock;
        x: lblock.x + lblock.width +20; y:lblock.y;
        width: (root.width - 30) /2 -10
        height: (root.height - 60)
        color: "white"
        DialPad{
            anchors.centerIn: parent
        }
    }
}
