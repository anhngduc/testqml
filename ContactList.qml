import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Contact 1.0
import DialFilter 1.0

ColumnLayout{
    Rectangle {
        id:tabbar
        width: parent.width; height: 50
        color: "white"
        anchors.top: parent.top

        Row {
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 2

            Rectangle {
                width: tabbar.width/3;
                height: tabbar.height;
                color: "white"
                border.color: "lightblue"
                Text {
                    id: name
                    text: qsTr("Contacts")
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {dialFilter.resetContactList(); }

                }
            }
            Connections{
                target: dialFilter
                onColor1Changed: searchTab.color = dialFilter.color1()
            }
            Rectangle {
                id: searchTab
                width: tabbar.width/3;
                height: tabbar.height;
                color: dialFilter.color1()
                border.color: "lightblue"
                Text {

                    text: qsTr("Search")
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

        }
    }
    Frame {
        background: Rectangle {
            color: "transparent"

        }

        ListView{

            id: listView

            implicitWidth:  lblock.width - 25
            implicitHeight: lblock.height - tabbar.height -counttext.contentHeight - 50

            clip: true
            anchors.fill: parent
            orientation:  Qt.Vertical
            spacing: 5
            model: ContactModel{
                list: dialFilter
            }



            delegate:

                Rectangle{
                width: parent.width
                height: 50
                color: "lightblue"

                ColumnLayout{
                    width: listView.width
                    spacing: 5
                    Text{
                        text: model.cName
                        font.bold: true
                        font.pixelSize: 20
                        anchors.left: parent.left
                        anchors.topMargin: 2
                        anchors.leftMargin: 5
                    }
                    Text{
                        horizontalAlignment: Text.AlignRight
                        text: model.cPhone
                        Layout.fillWidth: true
                    }

                }
                MouseArea {
                    id:mouse
                    anchors.fill: parent

                }
                DialPad{
                    id:click
                    targetitem: mouse
                }
            }
        }
    }
    Text {
        id: counttext
        text: listView.count + " contacts"
        anchors.horizontalCenter: parent.horizontalCenter
    }

}

