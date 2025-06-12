# license.py
from PyQt6.QtWidgets import QApplication, QWidget, QLabel, QVBoxLayout
from PyQt6.QtGui import QFont, QPixmap
from PyQt6.QtCore import Qt, QTimer
import sys
import os

class LicenseScreen(QWidget):
    def __init__(
        self,
        license_name: str = "scyl-SPv1.0",
        license_logo_path: str = None,
        logo_width: int = 96,
        logo_height: int = 96,
        font_family: str = "Segoe UI",
        title_style: dict = None,
        info_style: dict = None
    ):
        super().__init__()

        self.setFixedSize(480, 320)
        self.setWindowTitle("Information")

        self.setWindowFlags(
            Qt.WindowType.FramelessWindowHint |
            Qt.WindowType.Tool |
            Qt.WindowType.WindowStaysOnTopHint
        )
        self.setStyleSheet("background-color: white;")

        layout = QVBoxLayout()
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        # Show license logo if available
        if license_logo_path and os.path.exists(license_logo_path):
            logo_label = QLabel()
            pixmap = QPixmap(license_logo_path).scaled(
                logo_width, logo_height,
                Qt.AspectRatioMode.KeepAspectRatio,
                Qt.TransformationMode.SmoothTransformation
            )
            logo_label.setPixmap(pixmap)
            logo_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            layout.addWidget(logo_label)

        # Custom title, e.g. app-specific license name
        custom_title = QLabel("scyl-SPv1.0")
        title_font = QFont(font_family, (title_style or {}).get("size", 20))
        title_font.setBold((title_style or {}).get("bold", True))
        title_font.setItalic((title_style or {}).get("italic", False))
        custom_title.setFont(title_font)
        custom_title.setStyleSheet(f"color: {(title_style or {}).get('color', '#2C3E50')};")
        custom_title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(custom_title)

        # License full type name (e.g., "MIT License")
        license_label = QLabel(license_name)
        info_font = QFont(font_family, (info_style or {}).get("size", 16))
        info_font.setBold((info_style or {}).get("bold", False))
        info_font.setItalic((info_style or {}).get("italic", False))
        license_label.setFont(info_font)
        license_label.setStyleSheet(f"color: {(info_style or {}).get('color', '#7F8C8D')};")
        license_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(license_label)

        self.setLayout(layout)

def show_license_screen(
    duration_ms: int = 3000,
    license_name: str = "scyl-SPv1.0",
    license_logo_path: str = None,
    logo_width: int = 160,
    logo_height: int = 160,
    font_family: str = "Segoe UI",
    title_style: dict = None,
    info_style: dict = None
):
    app = QApplication(sys.argv)

    license_win = LicenseScreen(
        license_name=license_name,
        license_logo_path=license_logo_path,
        logo_width=logo_width,
        logo_height=logo_height,
        font_family=font_family,
        title_style=title_style,
        info_style=info_style
    )

    license_win.show()
    QTimer.singleShot(duration_ms, app.quit)
    app.exec()
