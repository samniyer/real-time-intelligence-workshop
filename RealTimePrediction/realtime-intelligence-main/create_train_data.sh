# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Set environment variables
#
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT_ID-ml
#
# Change directory to realtime directory
#
cd ./realtime
#
# Create data for Training 
# Run Dataflow Pipeline to create Training Dataset
# Note:  It will take around 15-20 minutes to complete the job.
#
python3 create_traindata.py --input bigquery --project $PROJECT_ID --bucket $BUCKET --region us-central1
#
cd ..
#
#In the GCP Cloud Console menu, navigate to Dataflow > Jobs 
#Open Traindata job and review the Job Graph
#