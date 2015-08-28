#include <iostream>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

using namespace std;

int main(int argc, char *argv[])
{
    if(argc != 4) {
        cout<<"usage: "<<argv[0]<<" x y z\n";
    } else {

        XColor c;
        Display *d = XOpenDisplay((char *) NULL);

        int x;  // Pixel x 
        int y;  // Pixel y
        int z;

        x=atoi(argv[1]);
        y=atoi(argv[2]);
        z=atoi(argv[3]);

        XImage *image;
        image = XGetImage (d, RootWindow (d, DefaultScreen (d)), x, y, 1, 1, AllPlanes, XYPixmap);
        c.pixel = XGetPixel (image, 0, 0);
        XFree (image);
        XQueryColor (d, DefaultColormap(d, DefaultScreen (d)), &c);

        if(z == 0) {
            cout << c.red/256 << "\n";
        } else if(z == 1) {
            cout << c.green/256 << "\n";
        } else if(z == 2) {
            cout << c.blue/256 << "\n";
        }
        return 0;

    }
}

