class AgentPolicies < Formula
  include Language::Python::Virtualenv

  desc "Policy framework for Claude Code and Cursor AI agents"
  homepage "https://github.com/Devleaps/agent-policies"
  url "URL"
  sha256 "SHA256"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  def post_install
    system bin/"devleaps-policy-client", "install"
  end

  def pre_uninstall
    system bin/"devleaps-policy-client", "uninstall"
  end

  def caveats
    <<~EOS
      Claude Code hooks configured automatically.

      By default, this uses the Devleaps hosted policy server at:
         https://agent-policies.devleaps.nl

      You can customize the server and other settings in:
         ~/.agent-policies/config.json

      Documentation: https://github.com/Devleaps/agent-policies
    EOS
  end

  test do
    assert_match "devleaps-policy-client - Policy enforcement client",
                 shell_output("#{bin}/devleaps-policy-client --help")
  end
end
