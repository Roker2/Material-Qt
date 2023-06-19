import "../BaseObjects"

pragma Singleton

ThemeBase{
    objectName: "Light Theme"

    primary: PaletteBasic{
        lighter: "#C8FACD"
        light: "#5BE584"
        main: "#00AB55"
        dark: "#007B55"
        darker: "#005249"
    }
    secondary: PaletteBasic{
        lighter: "#D6E4FF"
        light: "#84A9FF"
        main: "#3366FF"
        dark: "#1939B7"
        darker: "#091A7A"
    }
    info: PaletteBasic{
        lighter: "#CAFDF5"
        light: "#61F3F3"
        main: "#00B8D9"
        dark: "#006C9C"
        darker: "#003768"
    }
    success: PaletteBasic{
        lighter: "#D8FBDE"
        light: "#86E8AB"
        main: "#36B37E"
        dark: "#1B806A"
        darker: "#0A5554"
    }
    warning: PaletteBasic{
        lighter: "#FFF5CC"
        light: "#FFD666"
        main: "#FFAB00"
        dark: "#B76E00"
        darker: "#7A4100"
    }
    error: PaletteBasic{
        lighter: "#FFE9D5"
        light: "#FFAC82"
        main: "#FF5630"
        dark: "#B71D18"
        darker: "#7A0916"
    }
    social: PaletteSocial{
        facebook: "#1877F2"
        twitter: "#00AAEC"
        instagram: "#E02D69"
        linkedin: "#007EBB"
    }
    text: PaletteText{
        primary: "#212B36"
        secondary: "#637381"
        disabled: "#919EAB"
    }
    background: PaletteBackground{
        main: "#FFFFFF"
        paper: "#FFFFFF"
        neutral: "#F4F6F8"
    }
    action: PaletteAction{
        active: "#637381"
        hover: Qt.rgba(145, 158, 171, 0.08)
        selected: Qt.rgba(145, 158, 171, 0.16)
        disabled: Qt.rgba(145, 158, 171, 0.80)
        disabledBackground: Qt.rgba(145, 158, 171, 0.24)
        focus: Qt.rgba(145, 158, 171, 0.24)
    }
    other: PaletteOther{
        divider: "#919EAB"
    }

    main: PaletteGrey{
        p100: "#F9FAFB"
        p200: "#F4F6F8"
        p300: "#DFE3E8"
        p400: "#C4CDD5"
        p500: "#919EAB"
        p600: "#637381"
        p700: "#454F5B"
        p800: "#212B36"
        p900: "#161C24"
    }
}
