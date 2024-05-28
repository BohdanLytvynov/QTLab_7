import QtQuick

Rectangle {

    property alias content : but_text.text

    property color foreground : "white"
    property color bordercolor: "crimson"
    property bool buttonToggleButton: true

    signal buttonClick()
    signal buttonExit()
    signal buttonEnter()

    id: root
    color: "black"
    border.color: bordercolor
    width: 200
    height: 20

    Text {
        id: but_text
        text: qsTr("Content")
        color: foreground
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea
    {
        id: m_a
        anchors.fill: parent
        hoverEnabled: buttonToggleButton
        onEntered:
        {

            root.color = "white"
            but_text.color = "black"
            root.border.color = "darkorange"
            parent.buttonEnter();
        }
        onExited:
        {

            root.color = "black"
            but_text.color = "white"
            root.border.color = bordercolor
            parent.buttonExit();
        }
        onClicked:
        {
            root.color = "darkorange"
            root.border.color = "green"
            but_text.color = "black"
            parent.buttonClick();
        }

        onCanceled:
        {

        }
    }


}
