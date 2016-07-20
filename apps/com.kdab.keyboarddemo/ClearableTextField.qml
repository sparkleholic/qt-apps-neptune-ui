/****************************************************************************
**
** Copyright (C) 2016 Klarälvdalens Datakonsult AB (KDAB).
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.5

import utils 1.0
import controls 1.0

UIElement {
    id: root

    property alias text: textField.text;
    property alias hintText: textField.hintText;
    property alias icon: icon.source
    property alias inputMethodHints: textField.inputMethodHints

    Row {
        anchors.fill: parent

        Icon {
            id: icon

            anchors.verticalCenter: parent.verticalCenter
        }

        TextField {
            id: textField

            hspan: 10

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            forceFocusOnClick: true
        }

        Icon {
            id: clearIcon

            anchors.verticalCenter: parent.verticalCenter

            source: Qt.resolvedUrl("Images/icon_clear.png")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    text = "tmp"
                    text = ""
                }
            }
        }
    }
}