b=46;
ampH=15.4;
cabH=b;
thick=0.8;

cabCube();
translate([0,0,b]){ampCube();}

module cabCube() {
    translate([0,0,0]){rotate([90,0,0]){translate([-1,0,-1]){cabFront();}}}
    translate([b-2,0,0]){rotate([90,0,90]){translate([-1,0,-1]){cabFront();}}}
    translate([b-2,b-2,0]){rotate([90,0,180]){translate([-1,0,-1]){cabFront();}}}
    translate([0,b-2,0]){rotate([90,0,270]){translate([-1,0,-1]){cabFront();}}}
}

module cabFront() {
    h=cabH;
    cornerPositions = [[1,1,1], [1,h-1,1], [b-1,h-1,1], [b-1,1,1]];
    for (i=[0:3]) {
        hull() {
            translate(cornerPositions[i]){sphere(d=2,$fs=.3);}
            translate(cornerPositions[(i+1)%4]){sphere(d=2,$fs=.3);}
        }
    }
    // "plate"
    difference() {
        translate([1,1,0]){cube([b-2,h-2+2,thick]);}
        translate([2,2,-thick/2]){cube([b-4,h-4,2*thick]);}
    }
    // grid
    translate([1,1,0]){grid(b-2,h-2,thick);}
    // coreblade emblem
    color("SlateGray",1.0){
        translate([(b-30)/2,(b-30)/2,1]){scale([0.3,0.3,1]){
            linear_extrude(height = 2, center = true, convexity = 10){import("Coreblade.dxf", convexity=3);}
        }}
    }
}

module grid(x,y,t) {
    rot1=20;
    rot2=-20;
    l=x+y;
    rod=1;
    space=2.5;
    
    intersection(){
        for(xx = [-l:(rod+space):l]){
            rotate([0,0,rot1]){translate([xx,0,t/2]){cube([rod,2*l,t],center=true);}}        rotate([0,0,rot2]){translate([xx+x,0,t/2]){cube([rod,2*l,t],center=true);}}
        }
        translate([0,0,-t]){cube([x,y,3*t]);}
    }
}

module ampCube() {
    translate([0,0,0]){rotate([90,0,0]){translate([-1,0,-1]){ampFront();}}}
    translate([b-2,0,0]){rotate([90,0,90]){translate([-1,0,-1]){ampFront();}}}
    translate([b-2,b-2,0]){rotate([90,0,180]){translate([-1,0,-1]){ampFront();}}}
    translate([0,b-2,0]){rotate([90,0,270]){translate([-1,0,-1]){ampFront();}}}
    translate([0,0,ampH-1]){cube([b-2,b-2,1]);}
}

module ampFront() {
    h=ampH;
    cornerPositions = [[1,1,1], [1,h-1,1], [b-1,h-1,1], [b-1,1,1]];
    for (i=[0:3]) {
        hull() {
            translate(cornerPositions[i]){sphere(d=2,$fs=.3);}
            translate(cornerPositions[(i+1)%4]){sphere(d=2,$fs=.3);}
        }
    }
    
    // plate
    difference() {
        union() {
            translate([1,1,0]){cube([b-2,h-2,thick]);}
            translate([1+(b-2)/2,6+7.2/2,1]){scale([1,7.2,1]){rotate([0,90,0]){cylinder(d=1,h=b-2,center=true,$fs=.1);}}}
        }
        for (i=[0:7]) {
            translate([4.9+i*(1.7+0.5),6.6,-thick/2]){roundCube(1.7,6,3*thick,0.4);}
            translate([4.9+19.5+i*(1.7+0.5),6.6,-thick/2]){roundCube(1.7,6,3*thick,0.4);}
        }
    }
    // Knobs and switches 1.48 1.65 1.55
    color("SlateGray",1.0){
        translate([5.5,4,0.8+.5]){rotate([-15,0,0]){cylinder(d=0.6,h=1,center=false,$fs=.2);}}
        translate([7.4,4,0.8+.5]){rotate([15,0,0]){cylinder(d=0.6,h=1,center=false,$fs=.2);}}
        knobPositions_x = [10.5, 14.5,16.1,17.7,19.3,20.9,22.5, 24.3,25.9,27.5, 29.3,30.9,32.5, 34.3];
        for(knobPosition_x = knobPositions_x) {
            translate([knobPosition_x,4,1]){cylinder(d=1,h=1.2,center=false,$fs=.3);}
        }
        translate([36.5+0.8,4,1]){
            cylinder(d=1.6,h=0.8,center=false,$fs=.3);
            rotate([0,0,-15]){translate([-.25,-0.8,0]){cube([0.5,1.8,1.5]);}}
        }
    }
}

module roundCube(x,y,t,r) {
    points = [[r,r,0],[x-r,r,0],[x-r,y-r,0],[r,y-r,0]];
    hull() {
        for(i=[0:3]){
            translate(points[i]){cylinder(r=r,h=t,$fs=.1);}
        }
    }
}