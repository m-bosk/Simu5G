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

package simu5g.nodes.backgroundCell;

//
// This module configures the channel parameters associated with a ~BackgroundCell. It is used
// to compute the channel quality for background UEs (refer to the ~BackgroundUe module), which in
// turn is essential for deriving the correct allocation of time-frequency resources via the
// Adaptive Modulation and Coding mechanism.
//
simple BackgroundCellChannelModel
{
    parameters:
        @display("i=block/control");
        @class("BackgroundCellChannelModel");

        // Enable or disable shadowing
        bool shadowing = default(true);

        // Path loss scenario from ITU -->
        string scenario @enum(INDOOR_HOTSPOT, URBAN_MICROCELL, URBAN_MACROCELL, RURAL_MACROCELL, SUBURBAN_MACROCELL, UNKNOWN_SCENARIO) = default("URBAN_MACROCELL");

        // eNodeB height -->
        double nodeb_height @unit(m) = default(25m);
        // Building height -->
        double building_height @unit(m) = default(20m);
        // Determines if the UE is located inside a building
        bool inside_building = default(false);

        double street_width @unit(m) = default(20m); //TODO width
        double ue_height @unit(m) = default(1.5m);
        bool tolerateMaxDistViolation = default(false);

        double correlation_distance @unit(m) = default(50m);

        // Antenna Gain of UE --> with respect to an isotropic antenna
        double antennaGainUe @unit(dBi) = default(0dBi);
        // Antenna Gain of eNodeB -->
        double antennaGainEnB @unit(dBi) = default(18dBi);
        // Antenna Gain of Micro node -->
        double antennaGainMicro @unit(dBi) = default(5dBi);
        // Thermal Noise for 10 MHz of bandwidth -->
        double thermalNoise @unit(dBm) = default(-104.5dBm);
        // UE noise figure -->
        double ue_noise_figure @unit(dBm) = default(7dBm);
        // eNodeB noise figure -->
        double bs_noise_figure @unit(dBm) = default(5dBm);
        // Cable Loss -->
        double cable_loss @unit(dB) = default(2dB);

        // If true, enable the possibility to dynamically switch between LOS and NLOS path loss computation -->
        bool dynamic_los = default(false);
        // If dynamic LOS is false, this parameter, if true, computes LOS path loss; otherwise computes NLOS path loss -->
        bool fixed_los = default(false);
        // Enable or disable fading -->
        bool fading = default(true);
        // Fading type (JAKES or RAYLEIGH) -->
        string fading_type @enum(RAYLEIGH, JAKES) = default("JAKES");
        // If Jakes fading is used, this parameter specifies the number of paths (tap channels) -->
        int fading_paths = default(6);
        double delay_rms @unit(s) = default(363ns);

        // If true, enables the computation of inter-cell interference for UL and DL connections from background cells -->
        bool bgCell_interference = default(true);
        // If true, enables the computation of inter-cell interference for DL connections -->
        bool downlink_interference = default(true);
        // If true, enables the computation of interference for UL connections -->
        bool uplink_interference = default(true);
}
