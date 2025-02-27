# -*- encoding : utf-8 -*-

control 'V-63447' do
  title "The system must be configured to audit Account Management - User
        Account Management failures."
  desc  "Maintaining an audit trail of system activity logs can help identify
        configuration errors, troubleshoot service disruptions, and analyze compromises
        that have occurred, as well as detect attacks.  Audit logs are necessary to
        provide a trail of evidence in case the system or network is compromised.
        Collecting this data is essential for analyzing the security of information
        assets and detecting signs of suspicious and unexpected behavior.

        User Account Management records events such as creating, changing,
        deleting, renaming, disabling, or enabling user accounts."

  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'WN10-AU-000035'
  tag gid: 'V-63447'
  tag rid: 'SV-77937r1_rule'
  tag stig_id: 'WN10-AU-000035'
  tag fix_id: 'F-69375r1_fix'
  tag cci: %w[CCI-000018 CCI-000172 CCI-001403 CCI-001404
              CCI-001405 CCI-002130 CCI-002234]
  tag nist: ['AC-2 (4)', 'AU-12 c', 'AC-2 (4)', 'AC-2 (4)', 'AC-2 (4)', "AC-2 (4)", 'AC-6 (9)', 'Rev_4']
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: false
  tag mitigations: nil
  tag severity_override_guidance: false
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil

  desc "check", "Security Option \"Audit: Force audit policy subcategory settings
      (Windows Vista or later) to override audit policy category settings\" must be
      set to \"Enabled\" (WN10-SO-000030) for the detailed auditing subcategories to
      be effective.

      Use the AuditPol tool to review the current Audit Policy configuration:
      Open a Command Prompt with elevated privileges (\"Run as Administrator\").
      Enter \"AuditPol /get /category:*\".

      Compare the AuditPol settings with the following.  If the system does not audit
      the following, this is a finding:

      Account Management >> User Account Management - Failure"

  desc "fix", "Configure the policy value for Computer Configuration >> Windows
      Settings >> Security Settings >> Advanced Audit Policy Configuration >> System
      Audit Policies >> Account Management >> \"Audit User Account Management\" with
      \"Failure\" selected."

  describe.one do
    describe audit_policy do
      its('User Account Management') { should eq 'Failure' }
    end
    describe audit_policy do
      its('User Account Management') { should eq 'Success and Failure' }
    end
  end
end

