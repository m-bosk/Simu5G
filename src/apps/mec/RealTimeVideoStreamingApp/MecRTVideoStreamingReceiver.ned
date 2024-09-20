//
//                  Simu5G
//
// Authors: Giovanni Nardini, Giovanni Stea, Antonio Virdis (University of Pisa)
//
// This file is part of a software released under the license included in file
// "license.pdf". Please read LICENSE and README files before using it.
// The above files and the present reference are part of the software itself,
// and cannot be removed from it.
//

package simu5g.apps.mec.RealTimeVideoStreamingApp;

import inet.applications.contract.IApp;
import simu5g.nodes.mec.MECPlatform.IMECApp;

//
// This module is an application that is dynamically instantiated on a MEC host upon request
// from a ~RTVideoStreamingSender application via a ~DeviceApp.
// It receives video frames sent by the UE and simulates a playout buffer. Moreover, it records
// statistics related to the quality of the received video stream. Note that the statistics are
// collected by the ~RTVideoStreamingSender application at the UE side.
//
simple MecRTVideoStreamingReceiver like IMECApp, IApp
{
    parameters:
        @display("i=block/app;is=s");

        int packetSize @unit(B) = default(10B);
        string interfaceTableModule = default("");

        int mecAppIndex;
        int mecAppId;
        int localUePort;

        string mp1Address = default("");
        int mp1Port = default(10021);

        // Resource required info
        double requiredRam @unit("B");
        double requiredDisk @unit("B");
        double requiredCpu;

        // IApp parameters
        int timeToLive = default(-1); // If not -1, set the TTL (IPv4) or Hop Limit (IPv6) field of sent packets to this value
        int dscp = default(-1); // If not -1, set the DSCP (IPv4/IPv6) field of sent packets to this value
        int tos = default(-1); // If not -1, set the Type Of Service (IPv4) / Traffic Class (IPv6) field of sent packets to this value

        bool logger = default(false);

        double discardPercentage = 0.8;
        double initialPlayoutDelay @unit(s) = 150ms;

    gates:
        input mePlatformIn;
        output mePlatformOut;

        input socketIn;
        output socketOut;

}

