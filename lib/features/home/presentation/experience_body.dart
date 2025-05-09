import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/styles/styled_card.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

const expLen = 6;
const expPointSize = 16.0;
const expScaleFactor = 150.0;
const expPointFactor = exHeight / 2;

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.texts.experiences,
          subtitle: context.texts.experiencesDescription,
        ),
        const Gap(32),
        context.isDesktop
            ? const DesktopExperienceBody()
            : const PhoneExpericeBody(),
      ],
    );
  }
}

class DesktopExperienceBody extends StatelessWidget {
  const DesktopExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: expLen * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withOpacity(0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          for (int i = 0; i < expLen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * 150,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.colorScheme.onBackground,
                      ),
                    ),
                    ExperienceItem(),
                  ],
                ),
              ),
            Positioned(
              top: i * expScaleFactor + expPointFactor - (expPointSize / 2),
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: expPointSize,
                height: expPointSize,
                decoration: BoxDecoration(
                  color: context.colorScheme.onBackground.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: expPointSize / 2,
                  height: exHeight / 2,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onBackground.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class PhoneExpericeBody extends StatelessWidget {
  const PhoneExpericeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
        ],
      ),
    );
  }
}

const exWidth = 300.0;
const exHeight = 220.0;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      width: exWidth,
      height: exHeight,
      borderEffect: true,
      child: Column(
        children: [
          Text(
            'Experience Title',
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ExperienceDescriptionItem(),
                ExperienceDescriptionItem(),
                ExperienceDescriptionItem(),
                ExperienceDescriptionItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceDescriptionItem extends StatelessWidget {
  const ExperienceDescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onBackground,
          ),
        ),
        const Gap(6),
        Expanded(
          child: Text(
            'Description Item',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class MobileExperienceBody extends StatelessWidget {
  const MobileExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          for (int i = 0; i < expLen; i++) ...[
            Stack(
              alignment: Alignment.center,
              children: [
                // Timeline line
                if (i != expLen - 1)
                  Positioned(
                    top: exHeight / 2,
                    child: Container(
                      width: 3,
                      height: expScaleFactor,
                      color: context.colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                // Timeline point
                Positioned(
                  top: exHeight / 2 - expPointSize / 2,
                  child: Container(
                    width: expPointSize,
                    height: expPointSize,
                    decoration: BoxDecoration(
                      color: context.colorScheme.onBackground.withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: expPointSize / 2,
                        height: expPointSize / 2,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onBackground.withOpacity(
                            0.8,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                // Experience card
                Padding(
                  padding: EdgeInsets.only(top: expPointSize),
                  child: ExperienceItem(),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}
