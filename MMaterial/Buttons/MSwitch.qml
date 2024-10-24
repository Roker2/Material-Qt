import QtQuick
import QtQuick.Layouts

import MMaterial

Checkable {
    id: _root

    property int size: Size.Grade.M

    property PaletteBasic accent: Theme.primary

    property bool text_is_left: false

    property alias text: _label.text
    property alias label: _label

    implicitWidth: _switch.width + _label.anchors.leftMargin + _label.anchors.rightMargin + _label.implicitWidth
    implicitHeight: {
        if(size == Size.Grade.M)
            return Size.pixel20

        return Size.pixel16
    }

    Rectangle {
        id: _switch

        height: _root.height
        width: height * 1.6

        radius: 100
        anchors.right: {
            if (_root.text_is_left)
                return _root.right
        }

        states: [
            State {
                when: !_root.enabled
                name: "disabled"
                PropertyChanges { target: _root; opacity: 0.48 }
                PropertyChanges { target: _switch; color: Theme.main.transparent.p48 }
                PropertyChanges { target: _innerCircle; x: _root.checked ? _innerCircle.parent.width - _innerCircle.width : 0 }
            },
            State {
                when: _root.checked
                name: "checked"
                PropertyChanges { target: _root; opacity: 1 }
                PropertyChanges { target: _switch; color: _root.accent.main }
                PropertyChanges { target: _innerCircle; x: _innerCircle.parent.width - _innerCircle.width }
            },
            State {
                when: true
                name: "unchecked"
                PropertyChanges { target: _root; opacity: 1 }
                PropertyChanges { target: _switch; color: Theme.main.transparent.p48 }
                PropertyChanges{ target: _innerCircle; x: 0 }
            }
        ]
        transitions: [
            //scale elastic animation
            Transition {
                from: "unchecked"
                NumberAnimation {
                    target: _innerCircle
                    property: "x"
                    duration: 250
                    easing.type: Easing.OutQuad
                }
                ColorAnimation { target: _switch; duration: 250; easing.type: Easing.InOutQuad }
            },
            Transition {
                from: "checked"
                NumberAnimation {
                    target: _innerCircle
                    property: "x"
                    duration: 250
                    easing.type: Easing.OutQuad
                }
                ColorAnimation { target: _switch; duration: 250; easing.type: Easing.InOutQuad }
            }
        ]

        Item {
            id: _container

            anchors{
                fill: _switch
                margins: _switch.height * 0.15
            }

            Rectangle {
                id: _innerCircle

                anchors{
                    top: _container.top
                    bottom: _container.bottom
                }

                width: height

                radius: _switch.radius
                color: Theme.main.p100

                Rectangle {
                    id: _highlight

                    anchors.centerIn: _innerCircle

                    height: _root.mouseArea.containsMouse ? _innerCircle.height * 2.7 : 0
                    width: height

                    radius: height
                    visible: height > 0
                    opacity: _root.mouseArea.pressed ? 0.7 : 1
                    color: _root.checked ? _root.accent.transparent.p8 : Theme.action.hover

                    Behavior on height { SmoothedAnimation { duration: 150; easing.type: Easing.InOutQuad} }
                }
            }
        }
    }

    B2 {
        id: _label

        anchors{
            left: _root.text_is_left ? _root.left : _switch.right
            right: _root.text_is_left ? _switch.left : _root.right
            leftMargin: _root.text_is_left ? 0 : Size.pixel12
            rightMargin: _root.text_is_left ? Size.pixel12 : 0
        }

        height: _root.height

        visible: text.length > 0
        verticalAlignment: Qt.AlignVCenter
        maximumLineCount: 1
        elide: _root.text_is_left ? Text.ElideNone : Text.ElideRight
        wrapMode: Text.NoWrap
    }
}
