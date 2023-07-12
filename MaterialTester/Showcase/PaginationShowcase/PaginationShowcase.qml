import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Item {
    objectName: "Pagination"
    visible: showcaseLoader.status == Loader.Ready

    Item{
        anchors {
            fill: parent
            margins: Math.min(Window.width * 0.1, Window.height * 0.1)
        }

        CustomSwipeView {
            id: _paginatorSwipeView
            anchors {
                bottomMargin: _paginator.height + Size.pixel10
                fill: parent
            }
        }
        Paginator{
            id: _paginator
            indexView: _paginatorSwipeView
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
        }
    }

}
