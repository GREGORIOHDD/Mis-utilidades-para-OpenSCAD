/*
 * Copyright (c) 2019, Gilles Bouissac
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *   * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * 
 * Description: Metric fine screw thread test
 * Author:      Gilles Bouissac
 */
use <agentscad/lib-screw.scad>
use <agentscad/mxf-screw.scad>
use <agentscad/mxf-thread.scad>

// ----------------------------------------
//
//                  Showcase
//
// ----------------------------------------

module showName( d, z ) {
    %color( "gold" )
        translate( [0,-7,z] )
        rotate( [90,0,0] )
        linear_extrude(0.1)
        text( screwGetName(d), halign="center", valign="center", size=2, $fn=100 );
}

module showParts( part=0 ) {
    IX=20;
    color( "DodgerBlue" )
    translate( [50,7,-20] )
    rotate( [90,0,0] )
    linear_extrude(0.1)
        text( "MC MF",halign="center",valign="center",size=10,$fn=100 );

    if ( part==0 ) {
        s1 = MF1_6();
        s2 = MF5();
        s3 = MF6(tl=20);
        s4 = MF10(tl=30);
        s5 = MF12();
        s6 = MF22();
        translate([0,0,0]) {
            mxfNutHexagonalThreaded(s1, $fn=50);
            showName(s1, -2);
        }
        translate([15,0,0]) {
            mxfNutSquareThreaded(s2, $fn=50);
            showName(s2, -2);
        }
        translate([30,0,0]) {
            mxfBoltHexagonalThreaded(s3, $fn=50);
            showName(s3, -7);
        }
        translate([50,0,0]) {
            mxfBoltAllenThreaded(s4, $fn=50);
            showName(s4, -11);
        }
        translate([70,0,0]) {
            mxfThreadInternal(s5, $fn=50);
            showName(s5, -2);
        }
        translate([90,0,0]) {
            mxfThreadExternal(mxfClone(s6,16),$fn=50);
            showName(s6, -4);
        }
    }
    if ( part==1 ) {
        s1 = MF5(tl=20);
        translate([0*IX,0,0]) {
            mxfNutHexagonalThreaded(s1, $fn=100);
            showName(s1, -2);
        }
        translate([1*IX,0,0]) {
            mxfNutSquareThreaded(s1, $fn=100);
            showName(s1, -2);
        }
        translate([2*IX,0,0]) {
            mxfBoltHexagonalThreaded(s1, $fn=100);
            showName(s1, -7);
        }
        translate([3*IX,0,0]) {
            mxfBoltAllenThreaded(s1, $fn=100);
            showName(s1, -9);
        }
    }
    if ( part==2 ) {
        s1 = MF6(tl=20);
        translate([0*IX,0,0]) {
            mxfNutHexagonalThreaded(s1, $fn=100);
            showName(s1, -2);
        }
        translate([1*IX,0,0]) {
            mxfNutSquareThreaded(s1, $fn=100);
            showName(s1, -2);
        }
        translate([2*IX,0,0]) {
            mxfBoltHexagonalThreaded(s1, $fn=100);
            showName(s1, -9);
        }
        translate([3*IX,0,0]) {
            mxfBoltAllenThreaded(s1, $fn=100);
            showName(s1, -11);
        }
    }
}

showParts(0);
