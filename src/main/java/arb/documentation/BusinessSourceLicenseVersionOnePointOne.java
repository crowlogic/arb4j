package arb.documentation;

/**
 * {@link BusinessSourceLicenseVersionOnePointOne#getText()} returns the text of
 * the copyright terms that {@link TheArb4jLibrary} is made available under
 * 
 * @see TheArb4jLibrary
 * 
 * @see BusinessSourceLicenseVersionOnePointOne
 */
public class BusinessSourceLicenseVersionOnePointOne implements
                                                     License
{
  public static LicensedWork licensedWork     = new TheArb4jLibrary();

  public static String       changeDateClause =
                                              "Effective on the Change Date of March 19, 2024, or the fourth anniversary of the first publicly available distribution of a specific version of the \n"
                                                + "Licensed Work under this License, whichever comes first, the Licensor hereby grants you rights under the terms of the Change License, and the rights granted \n"
                                                + "in the paragraph above terminate.\n"
                                                + "\n"
                                                + "This software shall be licensed under the Business Source License v1.1 until 4 years after the date of March 19, 2024. On this Change Date, the software will \n"
                                                + "automatically transition to the Lesser General Public License (LGPL)";

  public String              personalUseGrant =
                                              "Personal and hobby use of the Licensed Work is allowed without a commercial license. However, if the Licensed Work is used within a \n"
                                                + "company, educational institution, or non-profit organization for more than two weeks, a commercial license is required. Production use means using arb4j to determine any result which is then used '"
                                                + "to do anything related to any sort of activity whatsoever. The use of the Licensed Work(arb4j) for commercial \n"
                                                + "product development of any kind or production use for any period of time, especially financial purposes (including option pricing, futures pricing, hedging, or similar financial calculations), \n"
                                                + "regardless of whether coinciding with being a personal, educational, or hobby use is prohibited and would be an instance of Production Use, thus \n"
                                                + "requiring a license. Exceptions to this for the purposes of testing and evaluation must be approved in writing by the Licensor ";

  @Override
  public String getText()
  {
    return "arb4j is the Licensed Work by Author and Licensor Stephen Andrew Crowley ©2024\n"
           + "\n"
           + "that is made available under the terms of the Business Source License™ v1.1 ©2023 by MariaDB plc, All Rights Reserved."
           + "\n===Licensed Work Definition===\n"
           + licensedWork
           + "===Additional Use Grant===\n"
           + personalUseGrant
           + "\n"
           + "===Change Date===\n"
           + changeDateClause
           + "\n===Terms===\n"
           + "\n"
           + licensedWork
           + "===Covenants of Licensor===\n"
           + "\n"
           + "In consideration of the right to use this License's text and the “Business Source License” name and trademark, Licensor covenants to MariaDB, and to all other \n"
           + "recipients of the licensed work to be provided by Licensor:\n"
           + "\n"
           + "to specify as the Change License the GPL Version 2.0 or any later version, or a license that is compatible with GPL Version 2.0 or a later version, where \n"
           + "“compatible” means that software provided under the Change License can be included in a program with software provided under GPL Version 2.0 or a later version. \n"
           + "Licensor may specify additional Change Licenses without limitation. To either:\n"
           + "\n"
           + "a) specify an additional grant of rights to use that does not impose any additional restriction on the right granted in this License, as the Additional Use Grant; \n"
           + "\n"
           + "or\n"
           + "\n"
           + "b) insert the text “None” to specify a Change Date. Not to modify this License in any other way.\n"
           + "\n"
           + "===Notice===\n"
           + "\n"
           + "The Business Source License(this document, or the “License”) is not an Open Source license. However, the Licensed Work will eventually be made available under an \n"
           + "Open Source License, as stated in this License.\n"
           + "\n"
           + "For more information on the use of the Business Source License for MariaDB products, please visit the MariaDB Business Source License FAQ. For more information \n"
           + "on the use of the Business Source License generally, please visit the Adopting and Developing Business Source License FAQ.\n"
           + "\n"
           + "";
  }

}
