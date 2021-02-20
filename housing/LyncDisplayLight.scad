side=42;
//diffusorHeight=side; // 42mm
diffusorHeight=side-4; // 38mm
//diffusorHeight=side-7; // 35mm
//diffusorHeight=10; // 10mm
rounding=4;
wall=2;
bottomHeight=18;
$fs=.5;
$fa=3;
diffThick=2;

/*
translate([0,0,0.1]){color("PaleTurquoise",1){diffusor();}}
color("DarkSlateGray"){bottomPart();}
*/
diffusor();
//diffusorSpreader();
bottomPart();

module diffusorSpreader() {
  y=1/(sin(atan2(side/2-1,diffusorHeight/2)));
  echo(y);
  difference() {
    translate([0,0,bottomHeight+diffusorHeight/2-.5]) {cylinder(r1=0,r2=side/2-1,h=diffusorHeight/2,center=false);}
    translate([0,0,bottomHeight+diffusorHeight/2+y-.5]) {cylinder(r1=0,r2=side/2-1,h=diffusorHeight/2,center=false);}
  }
}

module diffusor() {
    color("LightCyan",1.0){
        // upper hollow
        difference() {
            offset = side/2-rounding;
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                translate([offset,offset,bottomHeight]) {cylinder(r=rounding,h=1,center=false);}
                translate([offset,offset,bottomHeight+diffusorHeight-1]) {cylinder(r=rounding,h=1,center=false);}
            }}}
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                translate([offset,offset,bottomHeight-1]) {cylinder(r=rounding-diffThick,h=1,center=false);}
                translate([offset,offset,bottomHeight-1+diffusorHeight-1]) {cylinder(r=rounding-diffThick,h=1,center=false);}
            }}}
        }
        
        // bottom step
        difference() {
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                offset = side/2-rounding;
                translate([offset,offset,bottomHeight]) {cylinder(r=rounding,h=5,center=false);}
            }}}
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                offset = side/2-3-2;
                translate([offset,offset,bottomHeight-1]) {cylinder(r=2,h=5+2,center=false);}
            }}}
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                offset = side/2-3-2;
                offset2 = side/2-(rounding-1);
                translate([offset,offset,bottomHeight+1]) {cylinder(r=2,h=3+3,center=false);}
                translate([offset2,offset2,bottomHeight+1+4]) {cylinder(r=rounding-1,h=1,center=false);}
            }}}
        }
        
        // Hooks
        for(a=[0:90:360]) { rotate([0,0,a]) {
            translate([side/2-3,-2.5,bottomHeight-3]){cube([1,5,3]);}
            translate([side/2-2,0,bottomHeight-2]){sphere(r=1);}
        }}
    }
}


module bottomPart() {
    color([.2,.2,.2],1.0){

        bWall = 1.5; // floor thickness
        dispBoardWidth=6.11+24.38+7.51;
        
        // upper hollow
        difference() {
            offset = side/2-rounding;
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                translate([offset,offset,-bWall]) {cylinder(r=rounding,h=1,center=false);}
                translate([offset,offset,bottomHeight-1]) {cylinder(r=rounding,h=1,center=false);}
            }}}
            hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
                translate([offset,offset,0]) {cylinder(r=rounding-wall,h=1,center=false);}
                translate([offset,offset,bottomHeight+1]) {cylinder(r=rounding-wall,h=1,center=false);}
            }}}
            
            // Hook holes
            for(a=[0:90:360]) { rotate([0,0,a]) {
                translate([side/2-2,0,bottomHeight-2]){sphere(r=1);}
            }}
            
            // USB plug hole
            hull() {
                translate([-(side/2-wall-.1),7/2+1,3-2.5/2]) {rotate([0,90,180]) {cylinder(d=6,h=wall+1);}}
                translate([-(side/2-wall-.1),-7/2+1,3-2.5/2]) {rotate([0,90,180]) {cylinder(d=6,h=wall+1);}}
            }
            
            // Display hole
            translate([-24.4/2,-(side/2+wall),2.96+1.5]){cube([24.4,3*wall,7.58]);}
            // Dispaly board
            translate([-6.11-24.38/2-0.5/2,-side/2+wall+2,0.01]){cube([dispBoardWidth+.5,1.7,bottomHeight]);}
        }
        
        // Processor board support
        translate([-(side/2-wall)+34.3-5,-26/2,0]){cube([4,26,3]);} // back bottom
        translate([-(side/2-wall)+34.3+.5,-10/2,0]){cube([4,10,5]);} // back back
        translate([-(side/2-wall)+34.3+.5,20/2,0]){hook();} // back hook
        translate([-(side/2-wall)+34.3+.5,-20/2,0]){hook();} // back hook
        translate([-(side/2-wall),26/2-2-5.5,0]){cube([2,2,3]);} // front bottom 1
        translate([-(side/2-wall),26/2-7,0]){cube([8,7,1]);} // front bottom 1.2
        translate([-(side/2-wall),-26/2,0]){cube([2,2,3]);} // front bottom 2
        translate([-(side/2-wall),-26/2,0]){cube([8,7,2]);} // front bottom 2.2
        translate([-(side/2-wall)-0.01,-26/2,3+1.7]){cube([1,26-2,1]);} // front top
        translate([-(side/2-wall),26/2-2,0]){cube([1.5,1,3+1.7+1]);} // front side 1
        translate([-(side/2-wall),-26/2-1,0]){cube([1.5,1,3+1.7+1]);} // front side 2
        
        // Display support
        difference() {
            union() {
                translate([-6.11-24.38/2-1,-side/2+wall+2-2,0]){cube([2,1.7+3,bottomHeight]);}
                translate([24.38/2+7.51-1,-side/2+wall+2-1,0]){cube([2,1.7+2,bottomHeight]);}
            }
            translate([-6.11-24.38/2-0.5/2,-side/2+wall+2,1.5]){cube([dispBoardWidth+.5,1.7,2*bottomHeight]);}
        }
    }
}

module hook() {
    translate([0,-2.5,0]){ // back hook
        cube([2,5,3+1.5+2]);
        translate([0,5/2,3+1+0.5]){
            difference() {
                sphere(r=1,center=true);
                translate([2.01,0,0]){cube([4,4,4],center=true);}
            }
        }
    }
}