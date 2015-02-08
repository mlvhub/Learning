import QtQuick 2.4
import QtQuick.Controls 1.3

Column {

    property alias labelId: labelId
    property alias textId: textFieldId
    Label {
        id: labelId
        text: "Some Label"
    }
    TextField {
        id: textFieldId
        maximumLength: 100
    }
}
