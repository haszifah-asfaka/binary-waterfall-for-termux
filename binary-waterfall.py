import os
import sys

# PAKSA qtpy menggunakan backend PyQt5 native milik Termux
os.environ['QT_API'] = 'pyqt5'

# Pastikan folder 'src' masuk ke dalam path pencarian Python
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from src import binary_waterfall

if __name__ == "__main__":
    binary_waterfall.run()
