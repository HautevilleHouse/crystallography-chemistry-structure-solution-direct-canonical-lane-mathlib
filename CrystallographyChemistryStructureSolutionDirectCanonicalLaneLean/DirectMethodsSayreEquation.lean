import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure DirectMethodsSayreEquationPackage where
  structureFactorAmplitudes : ℕ → ℝ
  normalizedStructureFactors : ℕ → ℝ
  sayreEquation : (ℕ → ℝ) → (ℕ → ℝ) → Prop
  tangentFormula : (ℕ → ℝ) → (ℕ → ℝ) → Prop
  phaseDeterminationIterative : Prop

structure DirectMethodsSayreEquationEvidence (D : DirectMethodsSayreEquationPackage) where
  structureFactorAmplitudesPositive : ∀ h : ℕ, D.structureFactorAmplitudes h > 0
  normalizedStructureFactorsDefined : ∀ h : ℕ, D.normalizedStructureFactors h ≠ 0
  sayreEquationSatisfied : D.sayreEquation D.structureFactorAmplitudes D.normalizedStructureFactors
  tangentFormulaSatisfied : D.tangentFormula D.structureFactorAmplitudes D.normalizedStructureFactors
  phaseDeterminationIterativeClosed : D.phaseDeterminationIterative

def DirectMethodsSayreEquationClosed (D : DirectMethodsSayreEquationPackage) : Prop :=
  (∀ h : ℕ, D.structureFactorAmplitudes h > 0) ∧
  (∀ h : ℕ, D.normalizedStructureFactors h ≠ 0) ∧
  D.sayreEquation D.structureFactorAmplitudes D.normalizedStructureFactors ∧
  D.tangentFormula D.structureFactorAmplitudes D.normalizedStructureFactors ∧
  D.phaseDeterminationIterative

theorem direct_methods_sayre_equation_closed_from_evidence
    (D : DirectMethodsSayreEquationPackage) (E : DirectMethodsSayreEquationEvidence D) :
    DirectMethodsSayreEquationClosed D := by
  exact And.intro E.structureFactorAmplitudesPositive
    (And.intro E.normalizedStructureFactorsDefined
      (And.intro E.sayreEquationSatisfied
        (And.intro E.tangentFormulaSatisfied E.phaseDeterminationIterativeClosed)))

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse
