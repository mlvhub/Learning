import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Rectangle Demo")
    width: 640
    height: 480
    visible: true

   Item {
       anchors.centerIn:  parent
       Rectangle {
           id: firstRectId
           width: 200
           height: 50
           color: "#ff0000"
           z: 1
       }
       Rectangle {
           width: firstRectId.width/4
           height: firstRectId.height
           radius: 25
           border.width: 2
           border.color: "green"
           color: "blue"
           gradient: Gradient {
               GradientStop {
                   position: 0.00;
                   color: "#aac2e2";
               }
               GradientStop {
                   position: 1.00;
                   color: "#295ebb";
               }
           }
           anchors.centerIn: firstRectId
           anchors.verticalCenterOffset: 20
       }
   }
}
