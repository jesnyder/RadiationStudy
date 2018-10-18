// Title: Cylindrical coupons to test material formability with a 3D printer 

// All measurement in millimeters, mm

// Height of the base
h_base = 2; 

// Spacing and patterning of each cyllindrical coupon
num_of_row = 1; // 12 
num_of_col = 1; // 8

// Maximum radius and height of the each cylindrical coupon
r_well = 10.0; // 1.5 mm radius 
h_well = 5;  // 8 mm height
center_to_center = r_well*2+.5;
quality_fn = 500;

// Build an array of cylinders with final outer diamter
module cylinder_array_outer() {   
    for(j=[1:num_of_row]) {  
    for(i=[1:num_of_col]) {  
        translate([0, 0, 0]) 
        cylinder (h = h_well, r=r_well, $fn=quality_fn);
     }}}

// Build an array of cylinders to later be subtracted
module cylinder_array_inner() {   
    for(j=[1:num_of_row]) {  
    for(i=[1:num_of_col]) {  
        translate([0, 0, -h_well]) 
        cylinder (h = 3*h_well, r=0.5*r_well, $fn=quality_fn); 
     }}}
  
 // Build the cylinder array on a solid base
 module cylindrical_array_with_base() {    
    union(){
        //cube([(num_of_col+.5)*center_to_center, (num_of_row+.5)*center_to_center, h_base]);
        cylinder_array_outer ();
    } }
 
// Create hollow tubes  
 difference(){
    cylindrical_array_with_base();
    cylinder_array_inner();
 }
    
   