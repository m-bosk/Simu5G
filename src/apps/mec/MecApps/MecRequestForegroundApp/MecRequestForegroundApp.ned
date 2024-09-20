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

package simu5g.apps.mec.MecApps.MecRequestForegroundApp;

import inet.applications.contract.IApp;
import simu5g.nodes.mec.MECPlatform.IMECApp;

//
// This module implements a MEC application that issues GET requests to the
// ~LocationService every 500ms. This application can be utilized as an "independent MEC app" (see
// ~MecHost module), hence it does not require instantiation via the MEC orchestrator
// upon request from a User Equipment. Essentially, this application provides a quick
// way to generate configurable load to the Location Service and simulate different
// (and potentially more realistic) response times from the latter.
//
// TODO: make the period configurable
//
simple MecRequestForegroundApp like IMECApp, IApp
{
    parameters:
        bool allocateHostResources = default(false);

        int packetSize @unit(B) = default(10B);
        string interfaceTableModule = default("");
        int mecAppIndex = default(0);
        int mecAppId = default(0); // this will be overridden by getId() in initialize
        int localUePort = default(0); // not used in MecRequestBackgroundGeneratorApp

        string mp1Address = default("");
        int mp1Port = default(10021);

		 // resource required information
        double requiredRam @unit("B") = default(10MB);
        double requiredDisk @unit("B") = default(100MB);
        double requiredCpu = default(15000);

        double lambda @unit(s) = default(10ms);

        // IApp parameters
        int timeToLive = default(-1); // if not -1, set the TTL (IPv4) or Hop Limit (IPv6) field of sent packets to this value
        int dscp = default(-1); // if not -1, set the DSCP (IPv4/IPv6) field of sent packets to this value
        int tos = default(-1); // if not -1, set the Type Of Service (IPv4) / Traffic Class (IPv6) field of sent packets to this value

        bool logger = default(false);

    gates:
        input socketIn @labels(TcpCommand/up);
        output socketOut @labels(TcpCommand/down);

        input mePlatformIn;
        output mePlatformOut;

}
