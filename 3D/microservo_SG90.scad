module SG90(){
    //colore verde-main color
    color("Blue",0.8){ 
    //corpo principale
    cube([11.8,22.7,22.5]); 
    //ali di fissaggio
    difference(){    
    translate([0,4.3,-4.7]) cube([11.8,2.5,31.9]); 
        translate([5.9,7.3,-2.4])rotate([90,0,0])
        cylinder(r=1,h=3.5,$fn=100);
        translate([5.9,7.3,24.9])rotate([90,0,0])
        cylinder(r=1,h=3.5,$fn=100);
        translate([5.25,4,25.6])cube([1.3,3.2,2.3]);
        translate([5.25,4,-4.7])cube([1.3,3.2,2.3]);
    }
    //cilindro ghiera
    translate([5.9,0,16.6]) rotate([90,0,0])
        cylinder(r=5.9,h=4,$fn=100);
    }
    //cilindro rotante  
    translate([5.9,-4,16.6]) rotate([90,0,0])
        color("White",0.8)cylinder(r=2.3,h=3.2,$fn=100);       
}

SG90();