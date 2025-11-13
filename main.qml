import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 480
    height: 320
    title: "Minimal Modern QML UI"

    // 背景：渐变 + 轻微内边距
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1f2933" }  // 深色
            GradientStop { position: 1.0; color: "#111827" }  // 更深
        }

        // 中间的“卡片”
        Rectangle {
            id: card
            width: parent.width * 0.6
            height: parent.height * 0.5
            anchors.centerIn: parent
            radius: 18
            color: "#fafafa"
            opacity: 0.97
            border.color: "#e5e7eb"
            border.width: 1

            Column {
                anchors.centerIn: parent
                spacing: 16
                padding: 8

                Text {
                    text: "Qt Quick · Minimal UI"
                    font.pixelSize: 20
                    font.bold: true
                    color: "#111827"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "渐变背景 + 圆角卡片 + 按钮 hover 动画"
                    font.pixelSize: 12
                    color: "#6b7280"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width * 0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // 自定义按钮
                Rectangle {
                    id: button
                    width: 160
                    height: 40
                    radius: 20
                    anchors.horizontalCenter: parent.horizontalCenter

                    // 自定义属性：是否 hover
                    property bool hovered: false

                    // 根据 hovered 切换颜色 / 缩放
                    color: hovered ? "#3b82f6" : "#2563eb"
                    scale: hovered ? 1.05 : 1.0

                    // 平滑动画
                    Behavior on scale {
                        NumberAnimation {
                            duration: 120
                            easing.type: Easing.OutQuad
                        }
                    }

                    Behavior on color {
                        ColorAnimation { duration: 120 }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: hovered ? "Let's go 🚀" : "Click me"
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: button.hovered = true
                        onExited: button.hovered = false
                        onClicked: console.log("Button clicked")
                    }
                }
            }
        }
    }
}
