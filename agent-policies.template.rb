class AgentPolicies < Formula
  include Language::Python::Virtualenv

  desc "Policy framework for Claude Code and Cursor AI agents"
  homepage "https://github.com/Devleaps/agent-policies"
  url "https://files.pythonhosted.org/packages/source/d/devleaps-agent-policies/devleaps-agent-policies-VERSION.tar.gz"
  sha256 "SHA256"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Quick Start:

      Configure hooks:
         devleaps-policy-client install

      Documentation: https://github.com/Devleaps/agent-policies
    EOS
  end

  test do
    assert_match "devleaps-policy-client - Policy enforcement client",
                 shell_output("#{bin}/devleaps-policy-client --help")
  end
end
