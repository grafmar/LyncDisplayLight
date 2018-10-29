side=42;
rounding=4;
wall=2;
bottomHeight=18;
$fs=.5;
$fa=3;

//vader();
//diffusor();
//color("red"){cutOut();}
import("DarthVader_Diffusor_merged.stl", convexity=3);

/*
difference() {
    diffusor();
    cutOut();
    //translate([0,-50,0]){cube([100,100,100]);}
    //translate([-50,0,0]){cube([100,100,100]);}
}
*/

/*
translate([0,0,0.1]){color("PaleTurquoise",0.2){diffusor();}}
color("DarkSlateGray"){bottomPart();}
*/
//bottomPart();

module cutOut() {
    hull() {
        translate([0,0,bottomHeight-.1]){cylinder(d=15,h=1);}
        translate([0,0,65-20]){sphere(d=20);}
    }
    hull() {
        translate([0,0,53]){sphere(d=28);}
        translate([0,0,40]){sphere(d=28);}
    }
}

module vader() {
    vaderScale = 0.6;
    translate([0,-3,22.5]){rotate([0,0,180]){scale([vaderScale, vaderScale, vaderScale]){import("DarthVader_hollow.stl", convexity=3);}}}
//    translate([0,-3,22.5]){rotate([0,0,180]){scale([vaderScale, vaderScale, vaderScale]){import("vader_remap.stl", convexity=3);}}}
}

module diffusor() {
    // upper hollow
    offset = side/2-rounding;
    hull() {
        for(a=[0:90:360]) { rotate([0,0,a]) {
            translate([offset,offset,bottomHeight]) {cylinder(r=rounding,h=1,center=false);}
        }}
        translate([0,0,bottomHeight+5-1]) {cylinder(d=18,h=1,center=false);}
    }
    translate([0,0,bottomHeight+5-1]) {cylinder(d=18,h=3,center=false);}
    
    // bottom step
    difference() {
        hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
            offset = side/2-rounding;
            translate([offset,offset,bottomHeight]) {cylinder(r=rounding,h=1,center=false);}
        }}}
        hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
            offset = side/2-3-2;
            translate([offset,offset,bottomHeight-1]) {cylinder(r=2,h=1+2,center=false);}
        }}}
/*
        hull() { for(a=[0:90:360]) { rotate([0,0,a]) {
            offset = side/2-3-2;
            offset2 = side/2-(rounding-1);
            translate([offset,offset,bottomHeight+1]) {cylinder(r=2,h=3+3,center=false);}
            translate([offset2,offset2,bottomHeight+1+4]) {cylinder(r=rounding-1,h=1,center=false);}
        }}}
*/
    }
    
    // Hooks
    for(a=[0:90:360]) { rotate([0,0,a]) {
        translate([side/2-3,-2.5,bottomHeight-3]){cube([1,5,3]);}
        translate([side/2-2,0,bottomHeight-2]){sphere(r=1);}
    }}
}


module bottomPart() {
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

module hook() {
    translate([0,-2.5,0]){ // back hook
        cube([1,5,3+1.5+2]);
        translate([0,5/2,3+1.5+0.5]){
            difference() {
                sphere(r=1.5,center=true);
                translate([2.01,0,0]){cube([4,4,4],center=true);}
            }
        }
    }
}