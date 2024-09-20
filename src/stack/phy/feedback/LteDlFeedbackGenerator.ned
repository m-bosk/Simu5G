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


package simu5g.stack.phy.feedback;

//
// This is the Lte Downlink Feedback Generator.
// It manages periodic and aperiodic channel sensing and
// feedback transmission.
//
simple LteDlFeedbackGenerator
{
    parameters:
        @display("i=block/cogwheel");

        // The feedback type can be ALLBANDS, PREFERRED, or WIDEBAND.
        string feedbackType @enum(ALLBANDS,PREFERRED,WIDEBAND) = default("ALLBANDS");

        // Resource allocation type ("distributed" or "localized").
        string rbAllocationType @enum(distributed,localized) = default("localized");

        // Period for periodic feedback in TTI.
        int fbPeriod @unit(tti) = default(6tti);

        // Time interval between sensing and transmission in TTI.
        int fbDelay @unit(tti) = default(1tti);

        // Set to true if we also want to use periodic feedback.
        bool usePeriodic = default(true);

        // Initial transmission mode (see LteCommon.h).
        // Options include SINGLE_ANTENNA_PORT0, SINGLE_ANTENNA_PORT5, TRANSMIT_DIVERSITY, OL_SPATIAL_MULTIPLEXING,
        // CL_SPATIAL_MULTIPLEXING, and MULTI_USER.
        string initialTxMode @enum(SINGLE_ANTENNA_PORT0,SINGLE_ANTENNA_PORT5,TRANSMIT_DIVERSITY,OL_SPATIAL_MULTIPLEXING,CL_SPATIAL_MULTIPLEXING,MULTI_USER) = default("SINGLE_ANTENNA_PORT0");

        // Feedback Computation (warning: this should be compatible with
        // the analogue model and Decider.
        // xml feedbackComputation;

        // Type of generator: IDEAL, REAL, DAS_AWARE.
        // IDEAL: the feedback generator reports feedback for each transmission mode and for each resource unit.
        // REAL: the feedback generator reports feedback only for the last transmission mode used but for each resource unit.
        // DAS_AWARE: the feedback generator reports feedback only for the last transmission mode used and only for resource units in the antenna set.
        string feedbackGeneratorType @enum(IDEAL,REAL,DAS_AWARE) = default("IDEAL");
}

