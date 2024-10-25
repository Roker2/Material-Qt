import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "../../Components/Common"

ColumnLayout {
    id: _root

    RowLayout {
        id: _header

        Layout.minimumWidth: _root.width

        MButton {
            type: _stack.item?.objectName === "overview" ? MButton.Type.Contained : MButton.Type.Outlined
            text: qsTr("Overview")

            onClicked: _stack.sourceComponent = _overview
        }

        MButton {
            type: _stack.item?.objectName === "overview" ? MButton.Type.Outlined : MButton.Type.Contained
            text: qsTr("Speed comparison")

            onClicked: _stack.sourceComponent = _speedTest
        }

        Item { Layout.fillWidth: true }
    }

    MLoader {
        id: _stack

        Layout.topMargin: Size.pixel30
        Layout.fillHeight: true
        Layout.minimumWidth: _root.width

        asynchronous: true
        sourceComponent: _overview

        Component {
            id: _overview

            IconOverview {}
        }

        Component {
            id: _speedTest

            IconSpeedComparison {}
        }
    }
}

