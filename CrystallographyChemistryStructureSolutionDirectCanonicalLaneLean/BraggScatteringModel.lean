import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure BraggScatteringModelPackage where
  unitCellVolume : ℝ
  latticeSpacing : ℝ → ℝ
  structureFactor : ℕ → ℂ
  incidentWavelength : ℝ
  scatteringAngle : ℝ → ℝ
  intensityProfile : ℝ → ℝ
  braggLawSatisfied : Prop

structure BraggScatteringModelEvidence (B : BraggScatteringModelPackage) where
  unitCellVolumePositive : B.unitCellVolume > 0
  latticeSpacingPositive : ∀ h : ℕ, B.latticeSpacing (h : ℝ) > 0
  structureFactorFinite : ∀ n : ℕ, ‖B.structureFactor n‖ < ∞
  braggLawSatisfiedClosed : B.braggLawSatisfied

def BraggScatteringModelClosed (B : BraggScatteringModelPackage) : Prop :=
  B.unitCellVolume > 0 ∧
  (∀ h : ℕ, B.latticeSpacing (h : ℝ) > 0) ∧
  (∀ n : ℕ, ‖B.structureFactor n‖ < ∞) ∧
  B.braggLawSatisfied

theorem bragg_scattering_model_closed_from_evidence
    (B : BraggScatteringModelPackage) (E : BraggScatteringModelEvidence B) :
    BraggScatteringModelClosed B := by
  exact And.intro E.unitCellVolumePositive
    (And.intro E.latticeSpacingPositive
      (And.intro E.structureFactorFinite E.braggLawSatisfiedClosed))

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse
