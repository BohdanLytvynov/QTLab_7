import QtQuick
import QtQuick.Layouts
import Back_end 1.0
import "UI_functions.js" as Js_UI

Window {

    property real digit_but_width : 100;
    property real digit_but_height : 50;
    property real oper_butwidth : 50;
    property real oper_butheight : 50;

    id: window
    width: 640
    height: 480
    minimumWidth: 640;
    minimumHeight: 480;
    maximumHeight: 480;
    maximumWidth: 640;
    visible: true
    title: qsTr("Lab Work 7 + RGR")

    Calc_back
    {
        id: calc_back;
    }

    SmartTextField
    {
        id: result
        is_ReadOnly: true;
        anchors.top: parent.top; anchors.topMargin: 10;
        anchors.left: parent.left; anchors.leftMargin: 20;
        anchors.right: parent.right; anchors.rightMargin: 20;

        placeHolderText: qsTr("Here will be your result")
        height: 40

        fontProperties.pixelSize: 14
        fontProperties.bold: true
        fontProperties.italic: true

        errorFontProperties.pixelSize: 16

        errorForeground: "red"
    }

    Connections
    {
        id: calc_back_connection;

        target: calc_back;

        function onResultChanged()
        {
            result.errorText = calc_back.getError();

            result.text = calc_back.result;

            calc_back.reset();
        }
    }

    GridLayout
    {
        id: numbers_input

        anchors.top: result.bottom; anchors.topMargin: 30;
        anchors.left: parent.left; anchors.leftMargin: 20;


        uniformCellWidths: true;

        columns: 3;

        Calc_Button{
            id : n7
            width: digit_but_width; height: digit_but_height; content: qsTr("7");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n7.content);
                }
                else
                {
                    calc_back.setA(n7.content);
                }

                result.text += n7.content;
            }
        }
        Calc_Button{

            id: n8;

            width: digit_but_width; height: digit_but_height; content: qsTr("8");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n8.content);
                }
                else
                {
                    calc_back.setA(n8.content);
                }

                result.text += n8.content;
            }
        }
        Calc_Button{
            id: n9;
            width: digit_but_width; height: digit_but_height; content: qsTr("9");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n9.content);
                }
                else
                {
                    calc_back.setA(n9.content);
                }

                result.text += n9.content;
            }

        }

        Calc_Button{
            id: n4;
            width: digit_but_width; height: digit_but_height; content: qsTr("4");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n4.content);
                }
                else
                {
                    calc_back.setA(n4.content);
                }

                result.text += n4.content;
            }
        }
        Calc_Button{

            id: n5;
            width: digit_but_width; height: digit_but_height; content: qsTr("5");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n5.content);
                }
                else
                {
                    calc_back.setA(n5.content);
                }

                result.text += n5.content;
            }
        }
        Calc_Button{
            id: n6;
            width: digit_but_width; height: digit_but_height; content: qsTr("6");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n6.content);
                }
                else
                {
                    calc_back.setA(n6.content);
                }

                result.text += n6.content;
            }
        }

        Calc_Button{
            id: n1;
            width: digit_but_width; height: digit_but_height; content: qsTr("1");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n1.content);
                }
                else
                {
                    calc_back.setA(n1.content);
                }

                result.text += n1.content;
            }
        }
        Calc_Button{
            id: n2;
            width: digit_but_width; height: digit_but_height; content: qsTr("2");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n2.content);
                }
                else
                {
                    calc_back.setA(n2.content);
                }

                result.text += n2.content;
            }
        }
        Calc_Button{
            id: n3;
            width: digit_but_width; height: digit_but_height; content: qsTr("3");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n3.content);
                }
                else
                {
                    calc_back.setA(n3.content);
                }

                result.text += n3.content;
            }
        }

        Calc_Button{
            id: n0;
            width: digit_but_width; height: digit_but_height; content: qsTr("0");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(n0.content);
                }
                else
                {
                    calc_back.setA(n0.content);
                }

                result.text += n0.content;
            }
        }
        Calc_Button{
            id: ndot;
            width: digit_but_width; height: digit_but_height; content: qsTr(".");

            onButtonClick:
            {
                if(calc_back.getOperInput())
                {
                    calc_back.setB(ndot.content);
                }
                else
                {
                    calc_back.setA(ndot.content);
                }

                result.text += ndot.content;
            }
        }
        Calc_Button{

            id: nequal;
            width: digit_but_width;
            height: digit_but_height;
            content: qsTr("=");

            onButtonClick:
            {
                calc_back.calculate();
            }

        }
    }

    GridLayout
    {
        id: oper_input;

        anchors.top: result.bottom; anchors.topMargin: 30;
        anchors.left: numbers_input.right; anchors.leftMargin: 30;

        columns:1;
        rows: 4;

        Calc_Button{
            width: oper_butwidth;
            height: oper_butheight;
            content: qsTr("/");
        onButtonClick:
        {
            calc_back.setOperator("/");
            calc_back.setOperInput(true);
            result.text += " / ";
        }

        }
        Calc_Button{
            width: oper_butwidth;
            height: oper_butheight;
            content: qsTr("*");
        onButtonClick:
        {
            calc_back.setOperator("*");
            calc_back.setOperInput(true);
            result.text += " * ";
        }
        }
        Calc_Button{
            width: oper_butwidth;
            height: oper_butheight;
            content: qsTr("-");
        onButtonClick:
        {
            calc_back.setOperator("-");
            calc_back.setOperInput(true);
            result.text += " - ";
        }
        }
        Calc_Button{
            width: oper_butwidth;
            height: oper_butheight;
            content: qsTr("+");
        onButtonClick:
        {
            calc_back.setOperator("+");
            calc_back.setOperInput(true);
            result.text += " + ";
        }
        }
    }

    Calc_Button
    {
        id: clear
        anchors.top: result.bottom; anchors.topMargin: 30;
        anchors.left: oper_input.right; anchors.leftMargin: 30;
        width: 50;
        height: 50;
        content: qsTr("AC")
        onButtonClick:
        {
            calc_back.reset();

            result.text = "";

            result.errorText = "";

        }
    }
}
