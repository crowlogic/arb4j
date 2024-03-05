package arb.documentation;

import arb.logic.Clause;

/**
 * {@link BusinessSourceLicenseVersionOnePointOne#getText()} returns the text of
 * the copyright terms that {@link TheArb4jLibrary} is made available under
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BusinessSourceLicenseVersionOnePointOne implements
                                                     License
{
  public static LicensedWork licensedWork     = new TheArb4jLibrary();

  public static Clause       changeDateClause = () -> "Effective on the Change Date of December 18, 2023+4 years, or the fourth anniversary of the first publicly available distribution of a specific version of the \n"
                + "Licensed Work under this License, whichever comes first, the Licensor hereby grants you rights under the terms of the Change License, and the rights granted \n"
                + "in the paragraph above terminate.\n" + "\n"
                + "This software shall be licensed under the Business Source License v1.1 until 4 years after the date of December 18, 2023. On this Change Date, the software will \n"
                + "automatically transition to the Lesser General Public License (LGPL)";

  private Term               personalUseGrant = () -> "Personal, educational, and hobby use of the Licensed Work is allowed without a commercial license. However, if the Licensed Work is used within a \n"
                + "company or non-profit organization for more than two weeks, a commercial license is required. The use of the Licensed Work(arb4j) for commercial \n"
                + "product development of any kind, especially financial purposes (including option pricing, futures pricing, hedging, or similar financial calculations), \n"
                + "regardless of whether coinciding with being a personal, educational, or hobby use is prohibited and would be an instance of Production Use, thus \n"
                + "requiring a license. Exceptions to this for the purposes of testing and evaluation must be approved in writing by the Licensor.";

  @Override
  public String getText()
  {
    return "arb4j is the Licensed Work by Author and Licensor Stephen Andrew Crowley ©2024\n" + "\n"
                  + "that is made available under the terms of the Business Source License™ v1.1 ©2023 by MariaDB plc, All Rights Reserved."
                  + "\n===Licensed Work Definition===\n" + licensedWork.getLicensedWorkDefinition()
                  + "===Additional Use Grant===\n" + personalUseGrant.getLicensedWorkDefinition() + "\n" + "===Change Date===\n"
                  + changeDateClause.getLicensedWorkDefinition() + "\n===Terms===\n" + "\n"
                  + "The Licensor(Stephen Crowley) hereby grants you the right to\n" + "•  copy,\n" + "•  modify,\n"
                  + "•  create derivative works,\n" + "•  redistribute,\n"
                  + "•  and make non-production use of the Licensed Work.\n"
                  + "The Licensor may make an Additional Use Grant, above, permitting limited production use.\n"
                  + "All copies of the original and modified Licensed Work, and derivative works of the Licensed Work, are subject to this License. This License applies separately \n"
                  + "for each version of the Licensed Work and the Change Date may vary for each version of the Licensed Work released by Licensor.\n"
                  + "\n"
                  + "You must conspicuously display this License on each original or modified copy of the Licensed Work. If you receive the Licensed Work in original or \n"
                  + "modified form from a third party, the terms and conditions set forth in this License apply to your use of that work.\n"
                  + "\n"
                  + "Any use of the Licensed Work in violation of this License will automatically terminate your rights under this License for the current and all other versions of \n"
                  + "the Licensed Work.\n" + "\n"
                  + "This License does not grant you any right in any trademark or logo of Licensor or its affiliates (provided that you may use a trademark or logo of Licensor as \n"
                  + "expressly required by this License).TO THE EXTENT PERMITTED BY APPLICABLE LAW, THE LICENSED WORK IS PROVIDED ON AN “AS IS” BASIS. LICENSOR HEREBY DISCLAIMS ALL \n"
                  + "WARRANTIES AND CONDITIONS, EXPRESS OR IMPLIED, INCLUDING (WITHOUT LIMITATION) WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, \n"
                  + "AND TITLE. MariaDB hereby grants you permission to use this License's text to license your works, and to refer to it using the trademark “Business Source License”, \n"
                  + "as long as you comply with the Covenants of Licensor below\n" + "\n"
                  + "===Covenants of Licensor===\n" + "\n"
                  + "In consideration of the right to use this License's text and the “Business Source License” name and trademark, Licensor covenants to MariaDB, and to all other \n"
                  + "recipients of the licensed work to be provided by Licensor:\n" + "\n"
                  + "to specify as the Change License the GPL Version 2.0 or any later version, or a license that is compatible with GPL Version 2.0 or a later version, where \n"
                  + "“compatible” means that software provided under the Change License can be included in a program with software provided under GPL Version 2.0 or a later version. \n"
                  + "Licensor may specify additional Change Licenses without limitation. To either:\n" + "\n"
                  + "a) specify an additional grant of rights to use that does not impose any additional restriction on the right granted in this License, as the Additional Use Grant; \n"
                  + "\n" + "or\n" + "\n"
                  + "b) insert the text “None” to specify a Change Date. Not to modify this License in any other way.\n"
                  + "\n" + "===Notice===\n" + "\n"
                  + "The Business Source License(this document, or the “License”) is not an Open Source license. However, the Licensed Work will eventually be made available under an \n"
                  + "Open Source License, as stated in this License.\n" + "\n"
                  + "For more information on the use of the Business Source License for MariaDB products, please visit the MariaDB Business Source License FAQ. For more information \n"
                  + "on the use of the Business Source License generally, please visit the Adopting and Developing Business Source License FAQ.\n"
                  + "\n" + "";
  }

}
