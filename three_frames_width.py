# three_frames_width.py

import tkinter as tk

window = tk.Tk()

frame1 = tk.Frame(master=window, height=200, bg="red")
frame1.pack(fill=tk.X)
frame2 = tk.Frame(master=window, height=100, bg="yellow")
frame2.pack(fill=tk.X)
frame3 = tk.Frame(master=window, height=50, bg="blue")
frame3.pack(fill=tk.X)

window.mainloop()
