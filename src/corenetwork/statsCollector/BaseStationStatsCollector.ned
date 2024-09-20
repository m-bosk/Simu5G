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

package simu5g.corenetwork.statsCollector;

//
// This module collects the radio network information of an eNodeB, which can
// be accessed by the ~RNIService module of a ~MECHost. For example, this module
// provides information such as the utilization of Resource Blocks.
//
module BaseStationStatsCollector like StatsCollector
{
    parameters:
        string collectorType = default("eNBStatsCollector");

        bool movingAverage = default(false);

        // used to calculate L2 measurements as averages
        int prbUsagePeriods = default(15);
        int dataVolumePeriods = default(15);
        int activeUserPeriods = default(15); // 10*100ms = 1s
        int discardRatePeriods = default(15);
        int tPutPeriods = default(15);

        // period duration for each L2 measurement
        double prbUsagePeriod @unit(s) = default(0.01s); // TTI period
        double activeUserPeriod @unit(s) = default(0.1s);
        double dataVolumePeriod @unit(s) = default(0.5s);
        double delayPacketPeriod @unit(s) = default(0.05s);
        double discardRatePeriod @unit(s) = default(10s);
        double tPutPeriod @unit(s) = default(1s);

        @display("i=block/cogwheel");
        @class("BaseStationStatsCollector");
}

