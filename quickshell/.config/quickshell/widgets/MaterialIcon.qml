import "root:/config"

StyledText {
    property real fill

    font.family: Font.family.material
    font.pointSize: Font.size
    font.variableAxes: ({
            FILL: fill.toFixed(1)
        })
}
